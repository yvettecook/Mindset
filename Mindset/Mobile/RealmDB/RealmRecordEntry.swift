import Foundation
import Realm
import RealmSwift

class RealmRecordEntry: Object {

    let steps = List<RealmRecordStep>()
    dynamic var date: NSDate = Date.distantFuture as NSDate
    dynamic var formID: String = "unknown"

    convenience init(record: RecordEntry) {
        self.init()

        self.date = record.date as NSDate
        self.formID = record.formID

        let realmSteps = record.steps.map { RealmRecordStep(step: $0) }

        for i in realmSteps {
            self.steps.append(i)
        }
    }

    convenience init(steps: List<RealmRecordStep>, date: NSDate, formID: String) {
        self.init()
        self.date = date
        self.formID = formID
        for i in steps {
            self.steps.append(i)
        }
    }
    
}

