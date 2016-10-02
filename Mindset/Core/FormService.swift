import Foundation

protocol FormService {
    func saveResponse()
    func discardResponse()
    func completeResponse()
    func failedResponse()
}
