import Foundation

struct RecordResponse {
    let identifier: Identifier
    let type: ItemType
    let value: String?
}

extension RecordResponse: Equatable {

    static func ==(lhs: RecordResponse, rhs: RecordResponse) -> Bool {
        return lhs.identifier == rhs.identifier &&
            lhs.type == rhs.type &&
            lhs.value == rhs.value
    }

}
