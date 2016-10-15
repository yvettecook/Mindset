import Foundation
import Realm
import RealmSwift

class RealmRecordEntry: Object {

    let responses = List<RealmRecordResponse>()
    dynamic var date: NSDate = Date.distantFuture as NSDate
    dynamic var formID: String = "unknown"

    convenience init(record: RecordEntry) {
        self.init()

        self.date = record.date as NSDate
        self.formID = record.formID

        let realmResponses = record.responses.map { RealmRecordResponse(response: $0) }

        for i in realmResponses {
            self.responses.append(i)
        }
    }

    convenience init(responses: List<RealmRecordResponse>, date: NSDate, formID: String) {
        self.init()
        self.date = date
        self.formID = formID
        for i in responses {
            self.responses.append(i)
        }
    }
    
}

