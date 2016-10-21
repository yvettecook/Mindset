import Foundation
import ResearchKit

extension ItemType {
    static func fromORK(_ questionResult: ORKResult) throws -> ItemType {
        if questionResult.isKind(of: ORKTextQuestionResult.self) {
            return .text
        } else if questionResult.isKind(of: ORKScaleQuestionResult.self) {
            return .scale
        } else {
            throw ItemError()
        }
    }
}

struct ItemError: Error {}
