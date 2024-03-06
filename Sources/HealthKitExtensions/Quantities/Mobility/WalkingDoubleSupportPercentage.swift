import Foundation
import HealthKit

/**
 A quantity sample type that measures the percentage of time when both of the user’s feet touch the ground while walking steadily over flat ground.

 These samples measure the percentage of time during a walk that both of the user’s feet are on the ground. 
 A lower value indicates that the user spends more time with the weight on just one foot instead of two. 
 During a typical walk, this measure falls between 20% and 40%.
 Double support time varies depending on how fast the user walks and the terrain.
 
 The system automatically records double support samples on iPhone 8 or later.
 The user must carry their phone near their waist—such as in a pocket—and walk steadily on flat ground.
 The system records 10 to 30 walking double support samples on a typical day.
 iPhone doesn’t record double support samples if the user’s wheelchair status is on.
 
 These samples use percentage units (described in ``HKUnit``) and measure discrete values (described in ``HKQuantityAggregationStyle``).
 For example, the following code creates a percentage unit.
 ```
 let percentage = HKUnit.percent()
 ```

 The sample’s ``quantity`` property represents the percent of time the user had weight on both feet between the sample’s ``startDate`` and ``endDate`` properties.

 The default unit is percent.
 */
public struct WalkingDoubleSupportPercentage: HKDiscreteQuantity {

    public static let quantityTypeIdentifier: HKQuantityTypeIdentifier = .walkingDoubleSupportPercentage

    /// percent
    public static let defaultUnit: HKUnit = .percent()

    public let discreteQuantitySample: HKDiscreteQuantitySample

    public init(discreteQuantitySample: HKDiscreteQuantitySample) {
        self.discreteQuantitySample = discreteQuantitySample
    }
}
