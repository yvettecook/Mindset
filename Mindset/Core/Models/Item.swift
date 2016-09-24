import Foundation

typealias ItemIdentifier = String

typealias JSONDictionary = [String:String]

struct Item {
    let id: ItemIdentifier
    let type: ItemType
}

extension Item {

    init(json: JSONDictionary) {
        guard
            let id = json["id"],
            let stringlyType = json["type"],
            let type = ItemType(rawValue: stringlyType)
            else { fatalError() }

        self.id = id
        self.type = type
    }

}

// Mark - Equatable

extension Item: Equatable {}

func ==(lhs: Item, rhs: Item) -> Bool {
    return lhs.id == rhs.id &&
        lhs.type == rhs.type
}



enum ItemType: String {
    case text
}
