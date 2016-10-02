import Foundation

protocol FormActionListener: class {

    // TODO: map to ORKTaskViewControllerFinishReason
    func userDidSaveResponse()
    func userDidDiscardResponse()
    func userDidCompleteResponse()
    func userDidFailedResponse()
}
