import Foundation

protocol RecordService {
    func save(record: RecordEntry)
    func discardRecord()
    func complete(record: RecordEntry)
    func failedRecord()
}
