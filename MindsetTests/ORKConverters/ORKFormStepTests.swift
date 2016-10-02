import XCTest
import ResearchKit
@testable import Mindset

class ORKFormStepsTests: XCTestCase {

    func test_CanConvertStepToORKFormStep() {
        let step = Step.mock()
        let orkStep = stepToORKFormStep(step: step)

        let expectedORKStep = ORKFormStep(identifier: "1", title: "Step Title", text: "Step Prompt")
        expectedORKStep.formItems = [ORKFormItem(identifier: "item1", text: "", answerFormat: ORKTextAnswerFormat())]

        XCTAssertEqual(orkStep, expectedORKStep)
    }


}
