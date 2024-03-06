import Foundation
import HealthKit

/**
 A quantity sample type that measures the amount of time the user spent exercising.
 
 This quantity type measures every full minute of movement that equals or exceeds the intensity of a brisk walk.
 
 Apple watch automatically records exercise time.
 By default, the watch uses the accelerometer to estimate the intensity of the user’s movement.
 However, during workout sessions, the watch uses additional sensors, like the heart rate sensor and GPS, to generate estimates.
 
 ``HKWorkoutSession`` sessions also contribute to the exercise time.
 For more information, see [Fill the Activity rings](https://developer.apple.com/documentation/healthkit/hkworkout#2961963).
 These samples use time units (described in ``HKUnit``) and measure cumulative values (described in ``HKQuantityAggregationStyle``).

 The default unit is seconds.
 */
public struct AppleExerciseTime: HKCumulativeQuantity {

    public static let quantityTypeIdentifier: HKQuantityTypeIdentifier = .appleExerciseTime

    public static var defaultUnit: HKUnit = .second()

    public let cumulativeQuantitySample: HKCumulativeQuantitySample

    public init(cumulativeQuantitySample: HKCumulativeQuantitySample) {
        self.cumulativeQuantitySample = cumulativeQuantitySample
    }
}
