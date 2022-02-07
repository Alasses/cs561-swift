import Foundation
import Alamofire

public protocol WeatherService {
    func getGreeting(completion: @escaping (_ response: Result<Int, Error>) -> Void)
    func getTemperature(completion: @escaping (_ response: Result<Double, Error>) -> Void)
    func authUser(completion: @escaping (_ response: Result<Bool, Error>) -> Void)
}

class WeatherServiceImpl: WeatherService {

    let helloEnd = "http://ec2-3-93-143-170.compute-1.amazonaws.com:3000/v1/hello"
    let weatherEnd = "http://ec2-3-93-143-170.compute-1.amazonaws.com:3000/v1/weather"
    let authEnd = "http://ec2-3-93-143-170.compute-1.amazonaws.com:3000/v1/auth"

    private var token = "";

    func getGreeting(completion: @escaping (_ response: Result<Int, Error>) -> Void)
    {
        let headers: HTTPHeaders = [
            .authorization(bearerToken: token),
            .accept("application/json")
        ]

        AF.request(helloEnd, 
                    method: .get,
                    headers: headers).validate(statusCode: 200..<300).responseDecodable(of: Greeting.self) 
        { 
            response in
            switch response.result {
            case let .success(greet):
                let msgIn = greet.msg
                let secretIn = greet.secret
                print(msgIn)
                completion(.success(secretIn))

            case let .failure(error):
                completion(.failure(error))
            }
        }
    }

    func getTemperature(completion: @escaping (_ response: Result<Double, Error>) -> Void) 
    {
        let headers: HTTPHeaders = [
            .authorization(bearerToken: token),
            .accept("application/json")
        ]

        AF.request(weatherEnd, 
                    method: .get,
                    headers: headers).validate(statusCode: 200..<300).responseDecodable(of: Weather.self) 
        { 
            response in
            switch response.result {
            case let .success(weather):
                let temperature = weather.main.temp
                print(temperature)
                completion(.success(temperature))

            case let .failure(error):
                completion(.failure(error))
            }
        }
    }

    func authUser(completion: @escaping (_ response: Result<Bool, Error>) -> Void) 
    {
        let login = Login(user: "John Doe", password: "abc123")

        AF.request(authEnd, 
                    method: .post,
                    parameters: login,
                    encoder: JSONParameterEncoder.default).validate(statusCode: 200..<300).responseDecodable(of: Auth.self) 
        {
            response in
            switch response.result {
            case let .success(authInfo):

                self.token = authInfo.auth
                print("\nAuth token: \(self.token)\n")

                completion(.success(self.token != ""))

            case let .failure(error):
                print(error)
                completion(.failure(error))
            }
        }
    }

    private struct Login: Encodable {
        let user: String
        let password: String
    }

    private struct Auth: Decodable {
        let auth: String
    }

    private struct Weather: Decodable {
        let main: Main

        struct Main: Decodable {
            let temp: Double
        }
    }

    private struct Greeting: Decodable {
        let msg: String
        let secret: Int
    }

}
