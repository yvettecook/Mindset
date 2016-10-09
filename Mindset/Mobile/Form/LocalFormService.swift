import Foundation

struct LocalFormService: FormService {
    func newCBTForm() -> Form {
        guard
            let path = Bundle.main.path(forResource: "thought-record", ofType:"json"),
            let jsonData = NSData(contentsOfFile: path),
            let json = try! JSONSerialization.jsonObject(with: jsonData as Data, options: JSONSerialization.ReadingOptions.allowFragments) as? JSONDictionary
            else { fatalError("Could not generate new form") }

        return Form(json: json)
    }

    func saveResponse() {}
    func discardResponse() {}
    func completeResponse() {}
    func failedResponse() {}
}
