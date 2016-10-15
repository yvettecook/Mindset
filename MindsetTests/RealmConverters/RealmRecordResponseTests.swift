import XCTest
import Realm
import RealmSwift
@testable import Mindset

class RealmRecordResponseTests: XCTestCase {

    func test_CanCreateFromRecordResponseText() {
        let recordResponse = RecordResponse.example()
        let result = RealmRecordResponse(response: recordResponse)

        /* Realm Objects equatable definition defines objects as 
         equatable if they point to the same object in the Realm
         database. Which isn't so good for testing :( */

        XCTAssertEqual(result.identifier, "textResponse")
        XCTAssertEqual(result.type, "text")
        XCTAssertEqual(result.value, "Test response of type: text")
    }

    func test_CanCreateFromRecordResponseScale() {
        let recordResponse = RecordResponse.example(ofType: .scale)
        let result = RealmRecordResponse(response: recordResponse)

        XCTAssertEqual(result.identifier, "scaleResponse")
        XCTAssertEqual(result.type, "scale")
        XCTAssertEqual(result.value, "Test response of type: scale")
    }

}

extension RecordResponse {

    static func example(ofType type: ItemType = .text) -> RecordResponse {
        return RecordResponse(
            identifier: "\(type)Response",
            type: type,
            value: "Test response of type: \(type)"
        )
    }
    
}
