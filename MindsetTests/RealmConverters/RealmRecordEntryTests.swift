import XCTest
import Realm
import RealmSwift
@testable import Mindset

class RealmRecordEntryTests: XCTestCase {

    /* Realm Objects equatable definition defines objects as
     equatable if they point to the same object in the Realm
     database. Which isn't so good for testing :( */

    func test_CanCreateFromRecordEntry() {
        let recordEntry = RecordEntry.example()
        let result = RealmRecordEntry(record: recordEntry)

        XCTAssertEqual(result.date as Date, Date.distantPast)
        XCTAssertEqual(result.formID, "TestForm")

        let expectedResponses = List<RealmRecordResponse>()
        expectedResponses.append(RealmRecordResponse.init(identifier: "textResponse", type: "text", value: "Test response of type: text"))
        expectedResponses.append(RealmRecordResponse.init(identifier: "scaleResponse", type: "scale", value: "Test response of type: scale"))
        
        XCTAssertEqual(result.responses[0].identifier, expectedResponses[0].identifier)
        XCTAssertEqual(result.responses[0].type, expectedResponses[0].type)
        XCTAssertEqual(result.responses[0].value, expectedResponses[0].value)

        XCTAssertEqual(result.responses[1].identifier, expectedResponses[1].identifier)
        XCTAssertEqual(result.responses[1].type, expectedResponses[1].type)
        XCTAssertEqual(result.responses[1].value, expectedResponses[1].value)


    }

}

extension RecordEntry {

    static func example() -> RecordEntry {
        return RecordEntry(
            responses: [
                RecordResponse.example(ofType: .text),
                RecordResponse.example(ofType: .scale)
            ],
            date: Date.distantPast,
            formID: "TestForm")
    }

}
