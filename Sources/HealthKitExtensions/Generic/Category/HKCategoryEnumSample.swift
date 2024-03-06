import Foundation
import HealthKit

/**
 A sample with a value consisting of an integer enumeration.
 */
@available(iOS 15.0, *)
public protocol HKCategoryEnumSample: HKCategorySampleContainer {

    associatedtype Value: RawRepresentable where Value.RawValue == Int

    var categorySample: HKCategorySample { get }

    init(categorySample: HKCategorySample)

    static var categoryTypeIdentifier: HKCategoryTypeIdentifier { get }
}

extension HKCategoryEnumSample {
    /**
     Create an enum sample.

     Used for all sample types where the value is an enum.
     */
    public init(value: Value, start: Date, end: Date, uuid: UUID? = nil, device: HKDevice? = nil, metadata: [String : Any]? = nil) {
        self.init(categorySample: .init(
            type: .init(Self.categoryTypeIdentifier),
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
public protocol HKCategoryValueSeveritySample: HKCategoryEnumSample where Value == HKCategoryValueSeverity {

}

public protocol HKCategoryPresenceSample: HKCategoryEnumSample where Value == HKCategoryValuePresence {

}
