import Foundation
import HealthKit

/**
 A cumulative quantity sample.
 */
public struct HKCumulativeQuantityValue<Identifier>: HKCumulativeQuantitySampleContainer where Identifier: HKQuantityTypeSpecification {

    public var cumulativeQuantitySample: HKCumulativeQuantitySample

    public init(cumulativeQuantitySample: HKCumulativeQuantitySample) {
        self.cumulativeQuantitySample = cumulativeQuantitySample
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
        self.init(cumulativeQuantitySample: .init(
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
