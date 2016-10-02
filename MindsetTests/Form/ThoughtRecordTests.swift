import XCTest
@testable import Mindset

class ThoughtRecordTests: XCTestCase {

    func test_CanMakeThoughtRecordForm() {
        guard
            let path = Bundle(for: type(of: self)).path(forResource: "thought-record", ofType:"json"),
            let jsonData = NSData(contentsOfFile: path),
            let json = try! JSONSerialization.jsonObject(with: jsonData as Data, options: JSONSerialization.ReadingOptions.allowFragments) as? JSONDictionary
            else {
                XCTFail()
                return
        }

        let actualForm = Form(json: json)

        let expectedForm = Form.mockThoughtRecord()

        XCTAssertEqual(actualForm, expectedForm)
    }

}

extension Form {

    static func mockThoughtRecord() -> Form {
        return Form(id: "ThoughtRecord1.0", name: "Thought Record", steps: [
            Step(
                id: "step1",
                title: "Situation / Trigger",
                prompt: "Body sensations",
                items: [
                    Item(id: "step1text", type: .text)
                ]
            ),
            Step(
                id: "step2",
                title: "Feelings / Emotions",
                prompt: "What emotion did I feel at that time? What else? How intense was it? What did I notice in my body? Where did I feel it?",
                items: [
                    Item(id: "step2scale", type: .scale),
                    Item(id: "step2text", type: .text)
                ]
            ),
            Step(
                id: "step3",
                title: "Unhelpful Thoughts / Images",
                prompt: "What went through my mind? What disturbed me? What did those thoughts/images/memories mean to me, or say about me or the situation? What am I responding to? What ‘button’ is this pressing for me? What would be the worst thing about that, or that could happen?",
                items: [
                    Item(id: "step3text", type: .text)
                ]
            ),
            Step(
                id: "step4",
                title: "Facts that support the unhelpful thought",
                prompt: "What are the facts? What facts do I have that the unhelpful thought/s are totally true?",
                items: [
                    Item(id: "step4text", type: .text)
                ]
            ),
            Step(
                id: "step5",
                title: "Facts that provide evidence against the unhelpful thought",
                prompt: "What facts do I have that the unhelpful thought/s are NOT totally true? Is it possible that this is opinion, rather than fact? What have others said about this?",
                items: [
                    Item(id: "step5text", type: .text)
                ]
            ),
            Step(
                id: "step6",
                title: "Alternative, more realistic and balanced perspective",
                prompt: "STOP! Take a breath.... What would someone else say about this situation? What’s the bigger picture? Is there another way of seeing it? What advice would I give someone else? Is my reaction in proportion to the actual event? Is this really as important as it seems?",
                items: [
                    Item(id: "step6text", type: .text)
                ]
            ),
            Step(
                id: "step7",
                title: "Outcome / Re-rate emotion",
                prompt: "What am I feeling now? What could I do differently? What would be more effective? Do what works! Act wisely. What will be most helpful for me or the situation? What will the consequences be?",
                items: [
                    Item(id: "step7scale", type: .scale),
                    Item(id: "step7text", type: .text)
                ]
            )
        ]
        )
    }

}
