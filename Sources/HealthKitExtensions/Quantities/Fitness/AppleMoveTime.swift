import Foundation
import HealthKit

public struct AppleMoveTimeSpecification: HKQuantityTypeSpecification {

    public static let identifier: HKQuantityTypeIdentifier = .appleMoveTime

    /// seconds
    public static let defaultUnit: HKUnit = .second()
}

/**
 A quantity sample type that measures the amount of time the user has spent performing activities that involve full-body movements during the specified day.
 
 `appleMoveTime` measures every full minute where the watch detects the user actively moving. 
 Apple Watch uses the accelerometer and gyroscopes to detect activities that involve full-body movements, like walking, running, or playing in the playground.

 For younger users, HealthKit’s activity summary can track move time instead of active energy burned:
 
 - HealthKit automatically tracks move time for any users under 13 years old.
 - Users 13 to 18 years old can choose whether to track move time or active calorie burn.
 - All users over 18 years old track active calorie burn.
 
 These samples use time units (described in ``HKUnit``) and measure cumulative values (described in ``HKQuantityAggregationStyle``).

 The default unit is seconds.
 */
public typealias AppleMoveTime = HKQuantityValue<AppleMoveTimeSpecification>
