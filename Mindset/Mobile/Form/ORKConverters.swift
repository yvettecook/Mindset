import ResearchKit

func convertToRecordResponse(from questionResult: ORKQuestionResult) -> RecordResponse {
    let identifier = questionResult.identifier
    let type = try! ItemType.fromORK(questionResult)

    let answer: String

    switch type {
    case .text:
        answer = (questionResult as! ORKTextQuestionResult).textAnswer!
    case .scale:
        answer = (questionResult as! ORKScaleQuestionResult).scaleAnswer!.stringValue
    }

    return RecordResponse(identifier: identifier, type: type, value: answer)
}

func convertToRecordStep(from stepResult: ORKStepResult) -> RecordStep {
    let identifier = stepResult.identifier
    var responses = [RecordResponse]()

    for result in stepResult.results! {
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
        let recordStep = convertToRecordStep(from: stepResult)
        steps.append(recordStep)
    }

    return RecordEntry(steps: steps, date: date!, formID: identifier)
}
