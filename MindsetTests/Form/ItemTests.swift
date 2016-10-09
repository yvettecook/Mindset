import XCTest
@testable import Mindset

class ItemTests: XCTestCase {

    func test_CanMakeFromJSON() {
        let json: JSONDictionary = [
            "id" : "item1",
            "type" : "text"
        ]

        let expectedItem = Item.example()
        let actualItem = Item(json: json)

        XCTAssertEqual(actualItem, expectedItem)
    }
    
}

extension Item {

    static func example(type: ItemType = .text) -> Item {
        return Item(
            id: "item1",
            type: type
        )

    }

}
