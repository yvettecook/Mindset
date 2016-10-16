import Foundation

protocol RecordDatabase {
    func save(record: RecordEntry)
    func readAllRecords() -> [RecordEntry]
}
