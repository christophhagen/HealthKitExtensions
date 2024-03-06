import Foundation
import HealthKit

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
public struct AppleMoveTime: HKCumulativeQuantity {

    public static let quantityTypeIdentifier: HKQuantityTypeIdentifier = .appleMoveTime

    public static var defaultUnit: HKUnit = .second()

    public let cumulativeQuantitySample: HKCumulativeQuantitySample

    public init(cumulativeQuantitySample: HKCumulativeQuantitySample) {
        self.cumulativeQuantitySample = cumulativeQuantitySample
    }
}
