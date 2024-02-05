import Foundation
import HealthKit

/// A protocol adopted by dietary samples
public protocol HKDietaryQuantitySampleContainer: HKQuantitySampleContainer {

}

/// - NOTE: The implementation of `HKDietaryQuantityValue` is identical to `HKQuantityValue`,
/// except the conformance to the protocol `HKDietaryQuantitySampleContainer` instead of `HKQuantitySampleContainer`.
/// This is done to restrict inputs to the `Food` correlation to dietary samples.

/**
 A dietary quantity sample.
 */
public struct HKDietaryQuantityValue<Identifier>: HKDietaryQuantitySampleContainer where Identifier: HKQuantityTypeSpecification {

    public var quantitySample: HKQuantitySample

    public init(quantitySample: HKQuantitySample) {
        self.quantitySample = quantitySample
    }

    public static var quantitySampleType: HKQuantityType { .init(Identifier.identifier) }

    public static var defaultUnit: HKUnit { Identifier.defaultUnit }

    /// The unit used for the sample by default
    public var defaultUnit: HKUnit { Identifier.defaultUnit }

    /**
     The value in the default unit

     To access the default unit, use ``defaultUnit``.
     To access the quanity directly, use ``quantity``.
     */
    public var value: Double {
        quantity.doubleValue(for: Identifier.defaultUnit)
    }

    /**
     Create a sample from a value in the default unit.
     */
    public init(value: Double, start: Date, end: Date, uuid: UUID? = nil, device: HKDevice? = nil, metadata: [String : Any]? = nil) {
        self.init(quantitySample: .init(
            type: .init(Identifier.identifier),
            quantity: .init(unit: Identifier.defaultUnit, doubleValue: value),
            start: start,
            end: end,
            device: device,
            metadata: metadata.adding(uuid: uuid)))
    }

    /**
     Create a sample from a quantity.
     */
    public init(quantity: HKQuantity, start: Date, end: Date, uuid: UUID? = nil, device: HKDevice? = nil, metadata: [String : Any]? = nil) {
        self.init(value: quantity.doubleValue(for: Self.defaultUnit), start: start, end: end, uuid: uuid, device: device, metadata: metadata)
    }
}
