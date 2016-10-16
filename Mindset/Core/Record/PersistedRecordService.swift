import Foundation

final class PersistedRecordService: RecordService {

    private let recordDatabase: RecordDatabase

    init(recordDatabase: RecordDatabase) {
        self.recordDatabase = recordDatabase
    }

    func save(record: RecordEntry) {
        print("SAVE FORM")
    }

    func discardRecord() {
        print("DISCARD FORM")
    }

    func complete(record: RecordEntry) {
        recordDatabase.save(record: record)
    }

    func failedRecord() {
        print("FAIL FORM")
    }

}
