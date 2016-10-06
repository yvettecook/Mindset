import XCTest
import ResearchKit
@testable import Mindset

class ORKFormStepsTests: XCTestCase {

    func test_CanConvertStepToORKFormStep() {
        let step = Step.example()
        let orkStep = stepToORKFormStep(step: step)

        let expectedORKStep = ORKStep.example()

        XCTAssertEqual(orkStep, expectedORKStep)
    }

}


extension ORKStep {

    static func example() -> ORKStep {
        let step = ORKFormStep(
            identifier: "1",
            title: "Step Title",
            text: "Step Prompt"
        )

        step.formItems = [
            ORKFormItem(
                identifier: "item1",
                text: "",
                answerFormat: ORKTextAnswerFormat())
        ]

        return step
    }

}
