import Foundation
import Realm
import RealmSwift

public struct RealmConversionError: Error {}

func convertToRecordEntry(from realmRecord: RealmRecordEntry) -> RecordEntry {
    var steps = [RecordStep]()

    realmRecord.steps.forEach {
        let step = convertToRecordStep(from: $0)
        steps.append(step)
    }

    let date = realmRecord.date as Date
    let formID = realmRecord.formID

    return RecordEntry(steps: steps, date: date, formID: formID)
}

func convertToRecordStep(from realmRecordStep: RealmRecordStep) -> RecordStep {
    var responses = [RecordResponse]()

    realmRecordStep.responses.forEach {
        let response = try! convertToRecordResponse(from: $0)
        responses.append(response)
    }

    let identifier = realmRecordStep.identifier

    return RecordStep(identifier: identifier, responses: responses)
}

func convertToRecordResponse(from realmRecordResponse: RealmRecordResponse) throws -> RecordResponse {
    let id = realmRecordResponse.identifier

    switch realmRecordResponse.type {
    case "scale":
        return RecordResponse(
            identifier: id,
            type: .scale,
            value: realmRecordResponse.value
            )
    case "text":
        return RecordResponse(
            identifier: id,
            type: .text,
            value: realmRecordResponse.value
            )
    default:
        throw RealmConversionError()
    }
}

