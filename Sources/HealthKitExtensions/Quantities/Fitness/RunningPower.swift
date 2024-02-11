import Foundation
import HealthKit

@available(iOS 16.0, watchOS 9.0, *)
public struct RunningPowerSpecification: HKQuantityTypeSpecification {

    public static let identifier: HKQuantityTypeIdentifier = .runningPower

    /// watt
    public static let defaultUnit: HKUnit = .watt()
}

/**
 A quantity sample type that measures the rate of work required for the runner to maintain their speed.

 These samples use power units (described in ``HKUnit``) and measure discrete values (described in ``HKQuantityAggregationStyle``).
 During outdoor running workouts, the system automatically records running power samples on Apple Watch SE and Series 6 and later.

 The default unit is Watt.
 */
@available(iOS 16.0, watchOS 9.0, *)
public typealias RunningPower = HKDiscreteQuantityValue<RunningPowerSpecification>
