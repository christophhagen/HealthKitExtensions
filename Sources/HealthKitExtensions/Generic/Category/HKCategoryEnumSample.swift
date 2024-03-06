import Foundation
import HealthKit

/**
 A sample with a value consisting of an integer enumeration.
 */
@available(iOS 15.0, *)
public struct HKCategoryGenericEnumSample<Identifier, Value>: HKCategorySampleContainer where Identifier: HKCategoryTypeIdentifierProvider, Value: RawRepresentable, Value.RawValue == Int {

    public var categorySample: HKCategorySample

    public init(categorySample: HKCategorySample) {
        self.categorySample = categorySample
    }

    public static var categoryTypeIdentifier: HKCategoryTypeIdentifier { Identifier.identifier }

    /**
     Create an enum sample.

     Used for all sample types where the value is an enum.
     */
    public init(value: Value, start: Date, end: Date, uuid: UUID? = nil, device: HKDevice? = nil, metadata: [String : Any]? = nil) {
        self.init(categorySample: .init(
            type: .init(Identifier.identifier),
            value: value.rawValue,
            start: start,
            end: end,
            device: device,
            metadata: metadata.adding(uuid: uuid)))
    }

    public var value: Value {
        .init(rawValue: categorySample.value)!
    }
}

@available(iOS 15.0, *)
public typealias HKCategoryEnumSample<Value> = HKCategoryGenericEnumSample<Value, Value> where Value: HKCategoryTypeIdentifierProvider, Value: RawRepresentable, Value.RawValue == Int

@available(iOS 15.0, *)
public typealias HKCategoryValueSeveritySample<T> = HKCategoryGenericEnumSample<T, HKCategoryValueSeverity> where T: HKCategoryTypeIdentifierProvider
