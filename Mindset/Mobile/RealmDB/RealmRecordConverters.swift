import Foundation
import Realm
import RealmSwift

public struct RealmConversionError: Error {}

func convertToRecordEntry(from realmRecord: RealmRecordEntry) -> RecordEntry {
    var responses = [RecordResponse]()

    realmRecord.responses.forEach {
        let response = try! convertToRecordResponse(from: $0)
        responses.append(response)
    }

    let date = realmRecord.date as Date
    let formID = realmRecord.formID

    return RecordEntry(responses: responses, date: date, formID: formID)

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

