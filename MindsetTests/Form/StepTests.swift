import XCTest
@testable import Mindset

class StepTests: XCTestCase {

    func test_CanMakeFromJSON() {
        let json = Step.exampleJSON()

        let expectedStep = Step.example()
        let actualStep = Step(json: json)

        XCTAssertEqual(actualStep, expectedStep)
    }
    
}

extension Step {
    static func exampleJSON() -> JSONDictionary {
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

    static func example() -> Step {
        return Step(
            id: "1",
            title: "Step Title",
            prompt: "Step Prompt",
            items: [
                Item.example()
            ]
        )
    }
}
