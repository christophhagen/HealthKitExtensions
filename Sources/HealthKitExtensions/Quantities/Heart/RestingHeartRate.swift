import Foundation
import HealthKit

public struct RestingHeartRateSpecification: HKQuantityTypeSpecification {

    public static let identifier: HKQuantityTypeIdentifier = .restingHeartRate

    /// counts per second
    public static let defaultUnit: HKUnit = .count().unitDivided(by: .second())
}

/**
 A quantity sample type that measures the user’s resting heart rate.

 These samples use count/time units (described in ``HKUnit``) and measure discrete values (described in ``HKQuantityAggregationStyle``).

 Resting heart rate is commonly correlated with overall cardiovascular health. 
 It is an estimation of the user’s lowest heart rate during periods of rest, and is intended to be used as a medically relevant metric.
 A resting heart rate sample is different than a sedentary heart rate sample (that is, a sample using the ``heartRate`` identifier with a ``HKHeartRateMotionContext.sedentary`` motion context).
 For example, if the user finishes a high-intensity workout, and then sits down to rest, the next heart rate sample may be marked as a sedentary sample, but it is still much higher than the user’s actual resting heart rate.
 To produce more accurate results, the system estimates the resting heart rate by analyzing sedentary heart rate samples throughout the day.
 
 Because the resting heart rate estimates become more accurate as the day progresses, the system may delete earlier samples and replace them with better estimates. 
 Apple Watch replaces only the samples written by the watch for the current or previous day.

 The default unit is counts per second.
 */
public typealias RestingHeartRate = HKQuantityValue<RestingHeartRateSpecification>
