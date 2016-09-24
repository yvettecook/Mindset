import Foundation

struct Form {
    let id: Identifier
    let name: String
    let steps: [Step]
}

// MARK: - Equatable

extension Form: Equatable {}

func ==(lhs: Form, rhs: Form) -> Bool {
    return lhs.id == rhs.id &&
        lhs.name == rhs.name &&
        lhs.steps == rhs.steps
}

// MARK: - JSONConvertible 

extension Form: JSONConvertible {
    init(json: JSONDictionary) {
        guard
            let id = json["id"] as? String,
            let name = json["name"] as? String,
            let stepsJSON = json["steps"] as? [JSONDictionary]
            else { fatalError() }

        self.id = id
        self.name = name
        self.steps = stepsJSON.map { Step(json: $0) }
    }
}

