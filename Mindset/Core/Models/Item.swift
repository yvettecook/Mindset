import Foundation

struct Item {
    let id: Identifier
    let type: ItemType
}

enum ItemType: String {
    case text
}

// MARK: - Equatable

extension Item: Equatable {}

func ==(lhs: Item, rhs: Item) -> Bool {
    return lhs.id == rhs.id &&
        lhs.type == rhs.type
}

// MARK: - JSONConvertible

extension Item: JSONConvertible {

    init(json: JSONDictionary) {
        guard
            let id = json["id"] as? String,
            let rawType = json["type"] as? String,
            let type = ItemType(rawValue: rawType)
            else { fatalError() }

        self.id = id
        self.type = type
    }

}


