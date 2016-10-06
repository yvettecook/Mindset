import XCTest
import ResearchKit
@testable import Mindset

class ORKFormTaskTests: XCTestCase {

    func test_CanConvertStepToORKFormTask() {
        let form = Form.example()
        let orkForm = formToORKOrderedTask(form: form)
        let expectedTask = ORKOrderedTask.example()

        XCTAssertEqual(orkForm, expectedTask)
    }
    
}


extension ORKOrderedTask {

    static func example() -> ORKOrderedTask {
        let introStep = ORKInstructionStep(identifier: "intro")
        introStep.title = "Form 1"

        let step1 = ORKStep.example()

        let summaryStep = ORKCompletionStep(identifier: "SummaryStep")
        summaryStep.title = "Completed"

        return ORKOrderedTask(
            identifier: "form1",
            steps: [introStep, step1, summaryStep])

    }

}
