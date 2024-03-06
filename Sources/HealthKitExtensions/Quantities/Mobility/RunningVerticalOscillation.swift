import Foundation
import HealthKit

/**
 A quantity sample type measuring pelvis vertical range of motion during a single running stride.

 These samples use length units (described in ``HKUnit``) and measure discrete values (described in ``HKQuantityAggregationStyle``). 
 During outdoor running workouts, the system automatically records vertical oscillation on Apple Watch SE and Series 6 and later.

 The default unit is meter.
 */
@available(iOS 16.0, watchOS 9.0, *)
public struct RunningVerticalOscillation: HKDiscreteQuantity {

    public static let quantityTypeIdentifier: HKQuantityTypeIdentifier = .runningVerticalOscillation

    /// meter
    public static let defaultUnit: HKUnit = .meter()

    public let discreteQuantitySample: HKDiscreteQuantitySample

    public init(discreteQuantitySample: HKDiscreteQuantitySample) {
        self.discreteQuantitySample = discreteQuantitySample
    }
}
