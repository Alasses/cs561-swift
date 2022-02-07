import XCTest
import MyLibrary

final class MyLibraryTests: XCTestCase {

    func testHello() throws
    {
        let myLibrary = MyLibrary()
        var ifAuth: Bool?    //Bool or nothing
        var secret: Int?

        let authExp = XCTestExpectation(description: "Ask server for authentication")
        let helloExp = XCTestExpectation(description: "Ask server for gretting and a secret number")

        //Get Authentication from server
        myLibrary.authentication(completion: {
            authResult in
            ifAuth = authResult
            authExp.fulfill()
        })

        wait(for: [authExp], timeout: 5)

        XCTAssert(ifAuth == true)

        myLibrary.helloAccess(completion: {
            secretIn in
            secret = secretIn
            helloExp.fulfill()
        })

        wait(for: [helloExp], timeout: 5)

        XCTAssert(secret == 114514)
    }

    func testWeather() throws 
    {
        let myLibrary = MyLibrary()
        var ifAuth: Bool?    //Bool or nothing
        var temp: Double?

        let authExp = XCTestExpectation(description: "Ask server for authentication")
        let weatherExp = XCTestExpectation(description: "Ask server weather information")

        //Get Authentication from server
        myLibrary.authentication(completion: {
            authResult in
            ifAuth = authResult
            authExp.fulfill()
        })

        wait(for: [authExp], timeout: 5)

        XCTAssert(ifAuth == true)

        myLibrary.weatherAccess(completion: {
            tempResult in
            temp = tempResult
            weatherExp.fulfill()
        })

        wait(for: [weatherExp], timeout: 5)

        XCTAssertNotNil(temp)
    }

}
