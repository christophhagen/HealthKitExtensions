import Foundation
import HealthKit

/**
 A cumulative quantity sample.
 */
public protocol HKCumulativeQuantity: HKQuantitySampleContainer {

    var cumulativeQuantitySample: HKCumulativeQuantitySample { get }

    init(cumulativeQuantitySample: HKCumulativeQuantitySample)

}

extension HKCumulativeQuantity {

    public var quantitySample: HKQuantitySample { cumulativeQuantitySample }

    public init(quantitySample: HKQuantitySample) {
        self.init(cumulativeQuantitySample: quantitySample as! HKCumulativeQuantitySample)
    }

    /// The sum of all the quantities contained by the sample.
    public var sumQuantity: HKQuantity { cumulativeQuantitySample.sumQuantity }

    /**
     Create a sample from a value in the default unit.
     */
    public init(value: Double, start: Date, end: Date, uuid: UUID? = nil, device: HKDevice? = nil, metadata: [String : Any]? = nil) {
        self.init(cumulativeQuantitySample: .init(
            type: Self.quantitySampleType,
            quantity: .init(unit: Self.defaultUnit, doubleValue: value),
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
