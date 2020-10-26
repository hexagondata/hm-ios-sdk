import XCTest
@testable import hexagonmatch_sdk

final class hexagonmatch_sdkTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
       
        let hmmanager = hexagonmatch_sdk(platformId: "1", tagId: "4001", clientId: "LAX")
        hmmanager.SendData(keyValue: "email@gmail.com", keyType: "email")
        
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}

