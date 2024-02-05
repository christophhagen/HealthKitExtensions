import Foundation
import HealthKit

@available(iOS 16.0, watchOS 9.0, *)
public struct RunningGroundContactTimeSpecification: HKQuantityTypeSpecification {

    public static let identifier: HKQuantityTypeIdentifier = .runningGroundContactTime

    /// seconds
    public static let defaultUnit: HKUnit = .second()
}

/**
 A quantity sample type that measures the amount of time the runner’s foot is in contact with the ground while running.

 These samples use time units (described in ``HKUnit``) and measure discrete values (described in ``HKQuantityAggregationStyle``).
 During outdoor running workouts, the system automatically records ground contact time on Apple Watch SE and Series 6 and later.

 The default unit is seconds.
 */
@available(iOS 16.0, watchOS 9.0, *)
public typealias RunningGroundContactTime = HKQuantityValue<RunningGroundContactTimeSpecification>

