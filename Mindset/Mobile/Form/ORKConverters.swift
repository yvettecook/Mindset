import ResearchKit

func convertToRecordResponse(from questionResult: ORKQuestionResult) -> RecordResponse {
    let identifier = questionResult.identifier
    let type = try! ItemType.fromORK(questionResult)

    let answer: String

    // TODO: Refactor!

    switch type {
    case .text:
        if let textResult = questionResult as? ORKTextQuestionResult {
            if let textAnswer = textResult.textAnswer {
                answer = textAnswer
            } else {
                answer = ""
            }
        } else {
            answer = ""
        }
    case .scale:
        if let scaleResult = questionResult as? ORKScaleQuestionResult {
            if let scaleAnswer = scaleResult.scaleAnswer {
                answer = scaleAnswer.stringValue
            } else {
                answer = ""
            }
        } else {
            answer = ""
        }
    }

    return RecordResponse(identifier: identifier, type: type, value: answer)
}

func convertToRecordStep(from stepResult: ORKStepResult) -> RecordStep? {
    let identifier = stepResult.identifier
    var responses = [RecordResponse]()

    guard
        let results = stepResult.results,
        results.count > 1
        else { return nil }

    for result in results {
        let questionResult = result as! ORKQuestionResult
        let response = convertToRecordResponse(from: questionResult)
        responses.append(response)
    }

    return RecordStep(identifier: identifier, responses: responses)
}

func convertToRecordEntry(from taskResult: ORKTaskResult) -> RecordEntry {
    let date = taskResult.endDate
    let identifier = taskResult.identifier

    var steps = [RecordStep]()

    for step in taskResult.results! {
        let stepResult = step as! ORKStepResult
        if let recordStep = convertToRecordStep(from: stepResult) {
            steps.append(recordStep)
        }
    }

    return RecordEntry(steps: steps, date: date!, formID: identifier)
}
