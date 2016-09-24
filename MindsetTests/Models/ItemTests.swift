import XCTest
@testable import Mindset

class ItemTests: XCTestCase {

    func test_CanMakeFromJSON() {
        let json = [
            "id" : "ItemID",
            "type" : "text"
        ]

        let item = Item(json: json)

        let expectedItem = Item(
            id: "ItemID",
            type: .text
        )

        XCTAssertEqual(item, expectedItem)
    }
    
}
