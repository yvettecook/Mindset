import Foundation

// TODO: Test

struct RecordStep {
    let identifier: Identifier
    let responses: [RecordResponse]
}

// MARK: - Equatable

extension RecordStep: Equatable {
    public static func ==(lhs: RecordStep, rhs: RecordStep) -> Bool {
        return lhs.identifier == rhs.identifier &&
            lhs.responses == rhs.responses
    }
}
