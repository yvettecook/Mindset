import Foundation

protocol FormService {
    func newCBTForm() -> Form

    func saveResponse()
    func discardResponse()
    func completeResponse()
    func failedResponse()
}
