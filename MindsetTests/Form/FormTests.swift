import XCTest
@testable import Mindset

class FormTests: XCTestCase {

    func test_CanMakeFromJSON() {
        let json: JSONDictionary = [
            "id" : "form1",
            "name" : "Form 1",
            "steps" : [
                Step.exampleJSON()
            ]

        ]

        let expectedForm = Form.example()

        let actualForm = Form(json: json)

        XCTAssertEqual(actualForm, expectedForm)
    }
    
}

extension Form {

    static func example() -> Form {
        return Form(
            id: "form1",
            name: "Form 1",
            steps: [
                Step.example()
            ]
        )
    }

}
