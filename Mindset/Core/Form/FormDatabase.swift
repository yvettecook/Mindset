import Foundation

protocol FormDatabase {
    func form(ofType: AvailableForm) -> Form
}

enum AvailableForm: String {
    case thoughtRecord = "thought-record"
}
