import Foundation
import HealthKit

/**
 A quantity sample type that measures the rate of work required for the runner to maintain their speed.

 These samples use power units (described in ``HKUnit``) and measure discrete values (described in ``HKQuantityAggregationStyle``).
 During outdoor running workouts, the system automatically records running power samples on Apple Watch SE and Series 6 and later.

 The default unit is Watt.
 */
@available(iOS 16.0, watchOS 9.0, *)
public struct RunningPower: HKDiscreteQuantity {

    public static let quantityTypeIdentifier: HKQuantityTypeIdentifier = .runningPower

    /// watt
    public static let defaultUnit: HKUnit = .watt()

    public let discreteQuantitySample: HKDiscreteQuantitySample

    public init(discreteQuantitySample: HKDiscreteQuantitySample) {
        self.discreteQuantitySample = discreteQuantitySample
    }
}
