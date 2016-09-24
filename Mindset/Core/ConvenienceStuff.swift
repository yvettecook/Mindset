import Foundation

typealias Identifier = String
typealias JSONDictionary = [String: Any]

protocol JSONConvertible {
    init(json: JSONDictionary)
}
