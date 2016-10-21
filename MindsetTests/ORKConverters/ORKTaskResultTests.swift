import XCTest
import ResearchKit
@testable import Mindset

class ORKTaskResultConverterTests: XCTestCase {

    func test_ConvertORKTaskResultToRecordEntry() {
        let taskResult = ORKTaskResult(identifier: "TestTask")
        taskResult.results = [
            ORKStepResult.example()
        ]
        taskResult.endDate = Date.distantPast

        let result = convertToRecordEntry(from: taskResult)

        let expected = RecordEntry(
            steps: [RecordStep(
                identifier: "step1",
                responses: [
                    RecordResponse(identifier: "step1scale", type: .scale, value: "4"),
                    RecordResponse(identifier: "step1text", type: .text, value: "Hello, world")
                ]
            )],
            date: Date.distantPast,
            formID: "TestTask")

        XCTAssertEqual(result, expected)
    }

    func test_ConvertNoAnswerORKTaskResultToRecordEntry() {
        let taskResult = ORKTaskResult(identifier: "TestTask")
        taskResult.results = [
            ORKStepResult.emptyExample()
        ]
        taskResult.endDate = Date.distantPast

        let result = convertToRecordEntry(from: taskResult)

        let expected = RecordEntry(
            steps: [RecordStep(
                identifier: "step1",
                responses: [
                    RecordResponse(identifier: "step1scale", type: .scale, value: ""),
                    RecordResponse(identifier: "step1text", type: .text, value: "")
                ]
                )],
            date: Date.distantPast,
            formID: "TestTask")

        XCTAssertEqual(result, expected)
    }

}
