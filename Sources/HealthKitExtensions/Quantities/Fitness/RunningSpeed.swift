import Foundation
import HealthKit

@available(iOS 16.0, watchOS 9.0, *)
public struct RunningSpeedSpecification: HKQuantityTypeSpecification {

    public static let identifier: HKQuantityTypeIdentifier = .runningSpeed

    /// m/s
    public static let defaultUnit: HKUnit = .meter().unitDivided(by: .second())
}

/**
 A quantity sample type that measures the runner’s speed.

 These samples use distance per time units (described in ``HKUnit``) and measure discrete values (described in ``HKQuantityAggregationStyle``).
 During outdoor running workouts, the system automatically records running speed samples on Apple Watch.

 The default unit is meter per second.
 */
@available(iOS 16.0, watchOS 9.0, *)
public typealias RunningSpeed = HKQuantityValue<RunningSpeedSpecification>
