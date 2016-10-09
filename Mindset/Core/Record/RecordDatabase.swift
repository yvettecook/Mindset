import Foundation

protocol RecordDatabase {
    func save(record: RecordEntry)
    func allRecords() -> [RecordEntry]
}
