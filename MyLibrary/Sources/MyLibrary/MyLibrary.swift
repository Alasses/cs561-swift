public class MyLibrary {
    private let weatherService: WeatherService

    /// The class's initializer.
    ///
    /// Whenever we call the `MyLibrary()` constructor to instantiate a `MyLibrary` instance,
    /// the runtime then calls this initializer.  The constructor returns after the initializer returns.
    public init(weatherService: WeatherService? = nil) {
        //self.weatherService = weatherService ?? WeatherServiceImpl()
        self.weatherService = WeatherServiceImpl()
    }

    public func authentication(completion: @escaping (Bool?) -> Void) 
    {
        weatherService.authUser {
            response in
            switch response {
            case let .failure(error):
                completion(false)

            case let .success(ifAuth):
                completion(ifAuth)
            }
        }
    }

    public func weatherAccess(completion: @escaping (Double?) -> Void) 
    {

        // Fetch the current weather from the backend.
        // If the current temperature, in Farenheit, contains an 8, then that's lucky.
        weatherService.getTemperature { 
            response in
            switch response {
            case let .failure(error):
                completion(nil)

            case let .success(temperature):
                completion(temperature)
            }
        }
    }

    public func helloAccess(completion: @escaping (Int?) -> Void) 
    {

        // Fetch the current weather from the backend.
        // If the current temperature, in Farenheit, contains an 8, then that's lucky.
        weatherService.getGreeting { 
            response in
            switch response {
            case let .failure(error):
                completion(nil)

            case let .success(secret):
                completion(secret)
            }
        }
    }



    /*
    public func isLucky(_ number: Int, completion: @escaping (Bool?) -> Void) {
        // Check the simple case first: 3, 5 and 8 are automatically lucky.
        if number == 3 || number == 5 || number == 8 {
            completion(true)
<<<<<<< Updated upstream
            return
=======
            return 
>>>>>>> Stashed changes
        }

        // Fetch the current weather from the backend.
        // If the current temperature, in Farenheit, contains an 8, then that's lucky.
        weatherService.getTemperature { response in
            switch response {
            case let .failure(error):
                print(error)
                completion(nil)

            case let .success(temperature):
                    let isLuckyNumber = self.contains(temperature, "8")
                    completion(isLuckyNumber)
            }
        }
    }

    /// Sample usage:
    ///   `contains(558, "8")` would return `true` because 588 contains 8.
    ///   `contains(557, "8")` would return `false` because 577 does not contain 8.
    private func contains(_ lhs: Int, _ rhs: Character) -> Bool {
        return String(lhs).contains(rhs)
    }
    */
}
