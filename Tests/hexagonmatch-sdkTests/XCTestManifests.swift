import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(hexagonmatch_sdkTests.allTests),
    ]
}
#endif
