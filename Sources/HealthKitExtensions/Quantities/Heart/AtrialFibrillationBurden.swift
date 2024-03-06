import Foundation
import HealthKit

/**
 A quantity type that measures an estimate of the percentage of time a person’s heart shows signs of atrial fibrillation (AFib) while wearing Apple Watch.

 On watchOS 9 and iOS 16 and later, once a person enables AFib History, Apple Watch begins collecting heart-rhythm data more frequently. 
 iPhone then calculates the AFib burden once a week, as long as Apple Watch has gathered enough heart-rhythm data during that week.
 
 If iPhone is unlocked and isn’t under heavy load, it starts analyzing heart rhythm samples around 8:00 am Monday morning.
 As soon as it finishes this analysis, iPhone sends the user a notification telling them the results.
 
 These samples use percentage units (described in ``HKUnit``) and measure discrete values (described in ``HKQuantityAggregationStyle``). The sample’s value represents an estimate of the percentage of time a person’s heart shows signs of AFib while wearing Apple Watch.
 
 - Important: These samples are read-only.
 You can request permission to read the samples using this identifier, but you can’t request authorization to share them.
 This means you can’t save new AFib burden samples to the HealthKit store.

 The default unit is percent.
 */
@available(iOS 16.0, watchOS 9.0, *)
public struct AtrialFibrillationBurden: HKDiscreteQuantity {

    public static let quantityTypeIdentifier: HKQuantityTypeIdentifier = .atrialFibrillationBurden

    /// percent
    public static let defaultUnit: HKUnit = .percent()

    public let discreteQuantitySample: HKDiscreteQuantitySample

    public init(discreteQuantitySample: HKDiscreteQuantitySample) {
        self.discreteQuantitySample = discreteQuantitySample
    }
}
