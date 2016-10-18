import XCTest
import ResearchKit
@testable import Mindset

class ORKStepResultConverterTests: XCTestCase {

    func test_ConvertORKStepResultToRecordStep() {
        let result = convertToRecordStep(from: ORKStepResult.example())

        let expected = RecordStep(
            identifier: "step1",
            responses: [
                RecordResponse(identifier: "step1scale", type: .scale, value: "4"),
                RecordResponse(identifier: "step1text", type: .text, value: "Hello, world")
            ]
        )

        XCTAssertEqual(result, expected)
    }

}

extension ORKStepResult {

    static func example() -> ORKStepResult {
        return ORKStepResult(stepIdentifier: "step1", results: [
            ORKScaleQuestionResult.example(),
            ORKTextQuestionResult.example()
            ]
        )
    }
}
