import XCTest
import ResearchKit
@testable import Mindset

class ORKFormItemTests: XCTestCase {

    func test_CanConvertTextItemToORKFormItem() {
        let item = Item.mock()
        let orkItem = itemToORKFormItem(item: item)

        let expectedORKItem = ORKFormItem(identifier: "item1", text: "", answerFormat: ORKTextAnswerFormat())

        XCTAssertEqual(orkItem, expectedORKItem)
    }

    func test_CanConvertScaleItemToORKFormItem() {
        let item = Item.mock(type: .scale)
        let orkItem = itemToORKFormItem(item: item)

        let expectedORKItem = ORKFormItem(identifier: "item1", text: "", answerFormat: ORKScaleAnswerFormat(maximumValue: 10, minimumValue: 0, defaultValue: 0, step: 1))

        XCTAssertEqual(orkItem, expectedORKItem)
    }
    
}
