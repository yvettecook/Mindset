import Foundation

struct RecordEntry {
    let steps: [RecordStep]
    let date: Date
    let formID: Identifier
}

// MARK: - Equatable

extension RecordEntry: Equatable {
    public static func ==(lhs: RecordEntry, rhs: RecordEntry) -> Bool {
        return lhs.steps == rhs.steps &&
            lhs.date == rhs.date &&
            lhs.formID == rhs.formID
    }
}
