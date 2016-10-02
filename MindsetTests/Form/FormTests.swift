import XCTest
@testable import Mindset

class FormTests: XCTestCase {

    func test_CanMakeFromJSON() {
        let json: JSONDictionary = [
            "id" : "form1",
            "name" : "Thought Record",
            "steps" : [
                Step.mockJSON()
            ]

        ]

        let expectedForm = Form(
            id: "form1",
            name: "Thought Record",
            steps: [
                Step.mock()
            ]
        )

        let actualForm = Form(json: json)

        XCTAssertEqual(actualForm, expectedForm)
    }
    
}
