import XCTest
import Realm
import RealmSwift
@testable import Mindset

class RealmConvertToRecordEntryTests: XCTestCase {
    
    func test_convertToRecordEntryFromRealmRecordEntry() {
        let realmRecordEntry = RealmRecordEntry(
            value: ["steps" : [RealmRecordStep.example()],
                    "date":  Date.distantPast as NSDate,
                    "formID": "test"])

        let result = convertToRecordEntry(from: realmRecordEntry)

        let expected = RecordEntry(
            steps: [RecordStep.example()],
            date: Date.distantPast,
            formID: "test")

        XCTAssertEqual(result, expected)
    }

    func test_convertToRecordStepFromRealmRecordStep() {
        let realmRecordStep = RealmRecordStep.example()

        let result = convertToRecordStep(from: realmRecordStep)

        let expected = RecordStep(
            identifier: "Step1",
            responses: [
                RecordResponse.example(ofType: .text)
            ])

        XCTAssertEqual(result, expected)

    }

    func test_convertToRecordResponseFromRealmRecordResponse() {
        let realmRecordResponse = RealmRecordResponse.example()

        let result = try! convertToRecordResponse(from: realmRecordResponse)

        let expected = RecordResponse.example(ofType: .text)

        XCTAssertEqual(result, expected)
    }

}

extension RecordStep {
    static func example() -> RecordStep {
        return RecordStep(
            identifier: "Step1",
            responses: [
                RecordResponse.example(ofType: .text)
            ]
        )
    }
}

extension RealmRecordStep {
    static func example() -> RealmRecordStep {
        return RealmRecordStep(
            value: [
                "responses" : [RealmRecordResponse.example()],
                "identifier" : "Step1"
            ]
        )
    }
}

extension RealmRecordResponse {
    static func example(ofType type: ItemType = .text) -> RealmRecordResponse {
        return RealmRecordResponse(
            identifier: "\(type)Response",
            type: "\(type)",
            value: "Test response of type: \(type)"
        )
    }
}
