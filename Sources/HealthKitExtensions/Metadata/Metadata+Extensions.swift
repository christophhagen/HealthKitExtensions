import Foundation
import HealthKit

public typealias Metadata = [String : Any]

extension Metadata {

    public subscript<T>(_ index: HKMetadataKey, as type: T.Type = T.self) -> T? {
        get {
            self[index.rawValue] as? T
        }
        set {
            self[index.rawValue] = newValue
        }
    }

    func value(for key: HKMetadataKey) -> Any? {
        self[key.rawValue]
    }

    func value<T>(for key: HKMetadataKey, as type: T.Type = T.self) -> T? {
        self[key.rawValue] as? T
    }

    func integer(for key: HKMetadataKey) -> Int? {
        guard let value = self[key.rawValue] as? NSNumber else {
            return nil
        }
        return value.intValue
    }

    mutating func set(number: Int?, for key: HKMetadataKey) {
        self[key] = number.map { $0 as NSNumber }
    }

    func quantity(for key: HKMetadataKey) -> HKQuantity? {
        value(for: key)
    }

    func quantityValue(for key: HKMetadataKey, unit: HKUnit) -> Double? {
        quantity(for: key)?.doubleValue(for: unit)
    }

    mutating func set(value: Any?, for key: HKMetadataKey) {
        self[key.rawValue] = value
    }

    mutating func set(quantity: HKQuantity?, for key: HKMetadataKey) {
        self[key.rawValue] = quantity
    }

    @discardableResult
    mutating func removeValue(for key: HKMetadataKey) -> Any? {
        self.removeValue(forKey: key.rawValue)
    }

    func excluding(key: HKMetadataKey) -> [String : Any] {
        let excludedKey = key.rawValue
        return filter { $0.key != excludedKey }
    }

    func excluding(keys: HKMetadataKey...) -> [String : Any] {
        let excludedKeys = Set(keys.map { $0.rawValue })
        return filter { !excludedKeys.contains($0.key) }
    }
}
