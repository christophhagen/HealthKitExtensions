import Foundation
import HealthKit

public struct WalkingHeartRateAverageSpecification: HKQuantityTypeSpecification {

    public static let identifier: HKQuantityTypeIdentifier = .walkingHeartRateAverage

    /// counts per second
    public static let defaultUnit: HKUnit = .count().unitDivided(by: .second())
}

/**
 A quantity sample type that measures the user’s heart rate while walking.

 These samples use count/time units (described in ``HKUnit``) and measure discrete values (described in ``HKQuantityAggregationStyle``).

 A user's average heart rate while walking is correlated to their fitness level, because it corresponds to their heart's efficiency while physically active.
 Apple Watch estimates the walking heart rate by averaging heart rate samples taken while the user is walking, as well as heart rate samples taken during walking workout sessions.
 
 Because walking heart rate estimates become more accurate as the day progresses, the system may delete earlier samples and replace them with better estimates.
 Apple Watch replaces only the samples written by the watch for the current or previous day.
 
 - Note: Walking heart rate samples are automatically created by HealthKit.
 You cannot save your own walking heart rate samples; however, you can query these samples.

 The default unit is counts per second.
 */
public typealias WalkingHeartRateAverage = HKDiscreteQuantityValue<WalkingHeartRateAverageSpecification>
