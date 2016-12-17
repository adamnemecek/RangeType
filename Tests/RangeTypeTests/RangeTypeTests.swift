import XCTest
@testable import RangeType

class RangeTypeTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(RangeType().text, "Hello, World!")
    }


    static var allTests : [(String, (RangeTypeTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
