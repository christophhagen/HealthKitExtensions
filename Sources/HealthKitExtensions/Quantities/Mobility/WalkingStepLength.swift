import Foundation
import HealthKit

/**
 A quantity sample type that measures the average length of the user’s step when walking steadily over flat ground.

 Step length is the distance between the user’s front foot and back foot when they walk. 
 The system automatically records walking step length samples on iPhone 8 or later.
 The user must carry their phone near their waist—such as in a pocket—and walk steadily on flat ground.
 To ensure accuracy, the user’s ``height`` value must be up to date.
 The system records 10 to 30 step length samples on a typical day.
 iPhone doesn’t record walking step length samples if the user’s wheelchair status is on.
 
 These samples use distance units (described in ``HKUnit``) and measure discrete values (described in ``HKQuantityAggregationStyle``).
 For example, the following code creates a unit in meters.
 ```
 let meters = HKUnit.meter()
 ```
 The sample’s ``quantity`` property represents the average step length between the sample’s ``startDate`` and ``endDate`` properties.
 
 The default unit is meters.
 */
public struct WalkingStepLength: HKDiscreteQuantity {

    public static let quantityTypeIdentifier: HKQuantityTypeIdentifier = .walkingStepLength

    /// meter
    public static let defaultUnit: HKUnit = .meter()

    public let discreteQuantitySample: HKDiscreteQuantitySample

    public init(discreteQuantitySample: HKDiscreteQuantitySample) {
        self.discreteQuantitySample = discreteQuantitySample
    }
}
