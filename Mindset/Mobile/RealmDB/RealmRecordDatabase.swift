import Realm
import RealmSwift

struct RealmRecordDatabase: RecordDatabase {

    func save(record: RecordEntry) {
        let convertedRecord = RealmRecordEntry(record: record)
        let realm = try! Realm()

        try! realm.write {
            realm.add(convertedRecord)
        }
    }

    func readAllRecords() -> [RecordEntry] {
        let realm = try! Realm()

        let realmRecords = realm.objects(RealmRecordEntry.self)
        let records: [RecordEntry] = realmRecords.flatMap { convertToRecordEntry(from: $0) }

        return records
    }

    func delete(record: RecordEntry) {
        let realm = try! Realm()
        let predicate = NSPredicate(format: "date = %@", record.date as NSDate)
        let recordToDelete = realm.objects(RealmRecordEntry.self).filter(predicate)

        try! realm.write {
            realm.delete(recordToDelete)
        }
    }

}
