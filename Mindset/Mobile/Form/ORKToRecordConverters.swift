import Foundation
import ResearchKit

// TODO: Do this properly

func orkTaskResultToRecord(task: ORKTaskResult) -> RecordEntry {
    let date = task.endDate
    let identifier = task.identifier
    let stepResults = task.results as! [ORKStepResult]

    let steps = stepResults.map { orkStepResultToRecordStep(step: $0)}

    return RecordEntry(steps: steps, date: date!, formID: identifier)
}

func orkStepResultToRecordStep(step: ORKStepResult) -> RecordStep {
    let responses = step.results as! [ORKStepResult]
    let recordResponses = orkStepResultToResponse(steps: responses)

    return RecordStep(identifier: step.identifier, responses: recordResponses)
}

func orkStepResultToResponse(steps: [ORKStepResult]) -> [RecordResponse] {
    var responses = [RecordResponse]()

    for result in steps {
        let response = orkResultToRecordResponse(result: result)
        responses.append(response)
    }

    return responses
}

func orkResultToRecordResponse(result: ORKResult) -> RecordResponse {
    let identifier = result.identifier
    let type = try! ItemType.fromORK(result)

    let answer: String

    switch type {
    case .text:
        answer = (result as! ORKTextQuestionResult).textAnswer!
    case .scale:
        answer = (result as! ORKScaleQuestionResult).scaleAnswer!.stringValue
    }

    return RecordResponse(identifier: identifier, type: type, value: answer)
}

extension ItemType {
    static func fromORK(_ questionResult: ORKResult) throws -> ItemType {
        if questionResult.isKind(of: ORKTextQuestionResult.self) {
            return .text
        } else if questionResult.isKind(of: ORKScaleQuestionResult.self) {
            return .scale
        } else {
            throw ItemError()
        }
    }
}

struct ItemError: Error {}
