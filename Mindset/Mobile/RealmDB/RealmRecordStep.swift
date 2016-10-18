import Foundation
import Realm
import RealmSwift

class RealmRecordStep: Object {

    let responses = List<RealmRecordResponse>()
    dynamic var identifier: String = "unknown"

    convenience init(step: RecordStep) {
        self.init()

        self.identifier = step.identifier

        let realmResponses = step.responses.map { RealmRecordResponse(response: $0) }

        for i in realmResponses {
            self.responses.append(i)
        }
    }

    convenience init(responses: List<RealmRecordResponse>, identifier: String) {
        self.init()
        self.identifier = identifier
        for i in responses {
            self.responses.append(i)
        }
    }

}
