import Foundation
import HealthKit

public typealias Metadata = [String : Any]

extension Metadata {

    public subscript<T>(_ index: MetadataKey) -> T? {
        get {
            self[index.rawValue] as? T
        }
        set {
            self[index.rawValue] = newValue
        }
    }

    func value(for key: MetadataKey) -> Any? {
        self[key.rawValue]
    }

    func value<T>(for key: MetadataKey, as type: T.Type = T.self) -> T? {
        self[key.rawValue] as? T
    }

    func quantity(for key: MetadataKey) -> HKQuantity? {
        value(for: key)
    }

    mutating func set(value: Any?, for key: MetadataKey) {
        self[key.rawValue] = value
    }

    mutating func set(quantity: HKQuantity?, for key: MetadataKey) {
        self[key.rawValue] = quantity
    }

    func excluding(key: MetadataKey) -> [String : Any] {
        let excludedKey = key.rawValue
        return filter { $0.key != excludedKey }
    }

    func excluding(keys: MetadataKey...) -> [String : Any] {
        let excludedKeys = Set(keys.map { $0.rawValue })
        return filter { !excludedKeys.contains($0.key) }
    }
}
