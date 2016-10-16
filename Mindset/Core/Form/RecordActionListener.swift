import Foundation

protocol RecordActionListener: class {

    // TODO: map to ORKTaskViewControllerFinishReason
    func userDidSave(record: RecordEntry)
    func userDidDiscardRecord()
    func userDidComplete(record: RecordEntry)
    func userDidFailedRecord()
}
