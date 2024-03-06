import Foundation
import HealthKit

/**
 A quantity sample type that measures the steadiness of the user’s gait.

 Samples that match the Walking Steadiness identifier use percentage units (described in ``HKUnit``) and measure discrete values (described in ``HKQuantityAggregationStyle``).
 For example, the following code creates a percentage unit.
 ```
 let percentage = HKUnit.percent()
 ```
 The value can be between 0.0 and 1.0.

 The system automatically records Walking Steadiness samples on iPhone 8 or later. 
 The user must carry their phone near their waist—such as in a pocket—and walk steadily on flat ground.
 To ensure accuracy, the user must set their ``height`` value in the Health app.
 The system creates a Walking Steadiness sample every 7 days—though the interval can be longer if it doesn’t have enough mobility data to calculate accurate results.
 iPhone doesn’t record Walking Steadiness samples if the user’s wheelchair status is on.
 
 Walking Steadiness samples are read-only.
 You can request permission to read the samples using this identifier, but you can’t request authorization to share them.
 This means you can’t save new Walking Steadiness samples to the HealthKit store.
 To add test data in iOS Simulator, open the Health app and select Browse > Mobility > Walking Steadiness > Add Data.

 The default unit is percent.
 */
public struct AppleWalkingSteadiness: HKDiscreteQuantity {

    public static let quantityTypeIdentifier: HKQuantityTypeIdentifier = .appleWalkingSteadiness

    /// joule
    public static let defaultUnit: HKUnit = .percent()

    public let discreteQuantitySample: HKDiscreteQuantitySample

    public init(discreteQuantitySample: HKDiscreteQuantitySample) {
        self.discreteQuantitySample = discreteQuantitySample
    }
}
