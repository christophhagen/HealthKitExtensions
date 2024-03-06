import Foundation
import HealthKit

/**
 A quantity sample type that measures the user’s peripheral perfusion index.
 
 The peripheral perfusion index measures the pulse strength at the monitoring site.
 These samples use percent units (described in ``HKUnit``) and measure discrete values (described in ``HKQuantityAggregationStyle``).

 The default unit is percent.
 */
public struct PeripheralPerfusionIndex: HKDiscreteQuantity {

    public static let quantityTypeIdentifier: HKQuantityTypeIdentifier = .peripheralPerfusionIndex

    /// percent
    public static let defaultUnit: HKUnit = .percent()

    public let discreteQuantitySample: HKDiscreteQuantitySample

    public init(discreteQuantitySample: HKDiscreteQuantitySample) {
        self.discreteQuantitySample = discreteQuantitySample
    }
}
