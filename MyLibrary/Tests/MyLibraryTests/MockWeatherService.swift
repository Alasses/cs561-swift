import Alamofire
import MyLibrary

/*
class MockWeatherService: WeatherService {
    private var shouldSucceed: Bool
    private var shouldReturnTemperatureWithAnEight: Bool

    init(shouldSucceed: Bool, shouldReturnTemperatureWithAnEight: Bool) {
        self.shouldSucceed = shouldSucceed
        self.shouldReturnTemperatureWithAnEight = shouldReturnTemperatureWithAnEight
    }

    func getWeather(completion: @escaping (_ response: Result<Int, Error>) -> Void) {
        switch (shouldSucceed, shouldReturnTemperatureWithAnEight) {
        case (true, true):
            let temperatureInFarenheit = 38
            completion(.success(temperatureInFarenheit))

        case (true, false):
            let temperatureInFarenheit = 39
            completion(.success(temperatureInFarenheit))

        case (false, _):
            let error404 = AFError.explicitlyCancelled
            completion(.failure(error404))
        }
    } 

    /*
    func getTemperature(completion: @escaping (_ response: Result<Int /* Temperature */, Error>) -> Void) {
        switch (shouldSucceed, shouldReturnTemperatureWithAnEight) {
        case (true, true):
            let temperatureInFarenheit = 38
            completion(.success(temperatureInFarenheit))

        case (true, false):
            let temperatureInFarenheit = 39
            completion(.success(temperatureInFarenheit))

        case (false, _):
            let error404 = AFError.explicitlyCancelled
            completion(.failure(error404))
        }
    }
    */
}
*/
