import Foundation

struct RecordEntry {
    let responses: [RecordResponse]
    let date: Date
    let formID: Identifier
}

// MARK: - Equatable

extension RecordEntry: Equatable {
    public static func ==(lhs: RecordEntry, rhs: RecordEntry) -> Bool {
        return lhs.responses == rhs.responses &&
            lhs.date == rhs.date &&
            lhs.formID == rhs.formID
    }
}
