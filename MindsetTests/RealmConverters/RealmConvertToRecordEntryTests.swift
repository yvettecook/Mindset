import XCTest
import Realm
import RealmSwift
@testable import Mindset

class RealmConvertToRecordEntryTests: XCTestCase {
    
    func test_convertToRecordEntryFromRealmRecordEntry() {
        let realmRecordEntry = RealmRecordEntry(
            value: ["responses" : [RealmRecordResponse.example()],
                    "date":  Date.distantPast as NSDate,
                    "formID": "test"])

        let result = convertToRecordEntry(from: realmRecordEntry)

        let expectedResult = RecordEntry(
            responses: [RecordResponse(identifier: "1",
                                       type: .text,
                                       value: "value")],
            date: Date.distantPast,
            formID: "test")

        XCTAssertEqual(result, expectedResult)
    }

    func test_convertToRecordResponseFromRealmRecordResponse() {
        let realmRecordResponse = RealmRecordResponse.example()

        let result = try! convertToRecordResponse(from: realmRecordResponse)

        let expectedResult = RecordResponse(identifier: "1", type: .text, value: "value")

        XCTAssertEqual(result, expectedResult)
    }

}

extension RealmRecordResponse {

    static func example() -> RealmRecordResponse {
        return RealmRecordResponse(
            identifier: "1",
            type: "text",
            value: "value"
        )
    }

}
