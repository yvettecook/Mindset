import XCTest
@testable import Mindset

class StepTests: XCTestCase {

    func test_CanMakeFromJSON() {
        let json = Step.mockJSON()

        let expectedStep = Step.mock()
        let actualStep = Step(json: json)

        XCTAssertEqual(actualStep, expectedStep)
    }
    
}

extension Step {
    static func mockJSON() -> JSONDictionary {
        return [
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
    }

    static func mock() -> Step {
        return Step(
            id: "1",
            title: "Step Title",
            prompt: "Step Prompt",
            items: [
                Item.mock()
            ]
        )
    }
}
