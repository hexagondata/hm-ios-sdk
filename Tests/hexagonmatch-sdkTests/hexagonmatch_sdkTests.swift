import XCTest
@testable import hexagonmatch_sdk

final class hexagonmatch_sdkTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(hexagonmatch_sdk().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
