import Foundation

struct Step {
    let id: Identifier
    let title: String
    let prompt: String
    let items: [Item]
}

// MARK: - Equatable

extension Step: Equatable {}

func ==(lhs: Step, rhs: Step) -> Bool {
    return lhs.id == rhs.id &&
        lhs.title == rhs.title &&
        lhs.prompt == rhs.prompt &&
        lhs.items == rhs.items
}

// MARK: - JSONConvertible

extension Step: JSONConvertible {
    init(json: JSONDictionary) {
        guard
            let id = json["id"] as? String,
            let title = json["title"] as? String,
            let prompt = json["prompt"] as? String,
            let itemsJSON = json["items"] as? [JSONDictionary]
            else { fatalError() }

        self.id = id
        self.title = title
        self.prompt = prompt
        self.items = itemsJSON.map { Item(json: $0) }
    }
}

