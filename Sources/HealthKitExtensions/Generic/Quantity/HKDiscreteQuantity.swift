import Foundation
import HealthKit

/**
 A discrete quantity sample.
 */
public protocol HKDiscreteQuantity: HKQuantitySampleContainer {

    var discreteQuantitySample: HKDiscreteQuantitySample { get }

    init(discreteQuantitySample: HKDiscreteQuantitySample)

}

extension HKDiscreteQuantity {

    public var quantitySample: HKQuantitySample { discreteQuantitySample }

    public init(quantitySample: HKQuantitySample) {
        self.init(discreteQuantitySample: quantitySample as! HKDiscreteQuantitySample)
    }

    /// The average of all quantities contained by the sample.
    public var averageQuantity: HKQuantity { discreteQuantitySample.averageQuantity }

    /// The maximum quantity contained by the sample.
    public var maximumQuantity: HKQuantity { discreteQuantitySample.maximumQuantity }

    /// The minimum value contained by the sample.
    public var minimumQuantity: HKQuantity { discreteQuantitySample.minimumQuantity }

    /// The most recent quantity contained by the sample.
    public var mostRecentQuantity: HKQuantity { discreteQuantitySample.mostRecentQuantity }

    /// The date interval for the most recent quantity contained by the sample.
    public var mostRecentQuantityDateInterval: DateInterval { discreteQuantitySample.mostRecentQuantityDateInterval }

    /**
     Create a sample from a value in the default unit.
     */
    public init(value: Double, start: Date, end: Date, uuid: UUID? = nil, device: HKDevice? = nil, metadata: [String : Any]? = nil) {
        self.init(discreteQuantitySample: .init(
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
