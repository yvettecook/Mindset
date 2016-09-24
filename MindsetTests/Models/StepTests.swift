import XCTest
@testable import Mindset

class StepTests: XCTestCase {

    func test_CanMakeFromJSON() {
        let json: JSONDictionary = [
            "id" : "1",
            "title" : "Step Title",
            "prompt" : "Step Prompt",
            "items" : [
                [
                    "id" : "item1",
                    "type" : "text"
                ]
            ]
        ]

        let expectedStep = Step(
            id: "1",
            title: "Step Title",
            prompt: "Step Prompt",
            items: [
                Item(
                    id: "item1",
                    type: .text
                )
            ]
        )

        let actualStep = Step(json: json)

        XCTAssertEqual(actualStep, expectedStep)
    }
    
}
