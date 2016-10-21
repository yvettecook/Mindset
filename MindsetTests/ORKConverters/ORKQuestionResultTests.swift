import XCTest
import ResearchKit
@testable import Mindset

class ORKQuestionResultTests: XCTestCase {

    func test_ConvertORKScaleQuestionResultToRecordResponse() {
        let result = convertToRecordResponse(from: ORKScaleQuestionResult.example())

        let expected = RecordResponse(identifier: "step1scale", type: .scale, value: "4")

        XCTAssertEqual(result, expected)
    }

    func test_ConvertORKTextQuestionResultToRecordResponse() {
        let result = convertToRecordResponse(from: ORKTextQuestionResult.example())

        let expected = RecordResponse(identifier: "step1text", type: .text, value: "Hello, world")

        XCTAssertEqual(result, expected)
    }

}

extension ORKScaleQuestionResult {
    static func example() -> ORKScaleQuestionResult {
        let scale = ORKScaleQuestionResult(identifier: "step1scale")
        scale.answer = 4
        return scale
    }

    static func emptyExample() -> ORKScaleQuestionResult {
        let scale = ORKScaleQuestionResult(identifier: "step1scale")
        scale.answer = nil
        return scale
    }
}

extension ORKTextQuestionResult {
    static func example() -> ORKTextQuestionResult {
        let text = ORKTextQuestionResult(identifier: "step1text")
        text.answer = "Hello, world"
        return text
    }

    static func emptyExample() -> ORKTextQuestionResult {
        let text = ORKTextQuestionResult(identifier: "step1text")
        text.answer = nil
        return text
    }
}
