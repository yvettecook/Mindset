import Foundation
import Realm
import RealmSwift

class RealmRecordResponse: Object {

    dynamic var identifier: String = ""
    dynamic var type: String = ""
    dynamic var value: String = ""

    convenience init(response: RecordResponse) {
        self.init()

        self.identifier = response.identifier
        self.type = response.type.rawValue

        if let value = response.value {
            self.value = value
        } else {
            self.value = ""
        }
    }

    convenience init(
        identifier: String,
        type: String,
        value: String) {
        self.init()
        self.identifier = identifier
        self.type = type
        self.value = value
    }

}


