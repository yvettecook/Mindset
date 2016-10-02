import XCTest
@testable import Mindset

class ItemTests: XCTestCase {

    func test_CanMakeFromJSON() {
        let json: JSONDictionary = [
            "id" : "item1",
            "type" : "text"
        ]

        let expectedItem = Item(
            id: "item1",
            type: .text
        )

        let actualItem = Item(json: json)

        XCTAssertEqual(actualItem, expectedItem)
    }
    
}
