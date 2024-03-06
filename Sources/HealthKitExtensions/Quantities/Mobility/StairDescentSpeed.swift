import Foundation
import HealthKit

/**
 A quantity sample type measuring the user’s speed while descending a flight of stairs.

 This is a measurement of how fast the user walks down stairs. 
 The system automatically records stair descent samples on Apple Watch Series 5 or later.
 The user must walk down a 10-foot (3-meter) flight of steps while wearing the watch.
 The system records 20 samples on a typical day; however, some days may go over 100 samples, for example if the user goes on a long hike.
 The watch doesn’t record stair descent speed samples if the user’s wheelchair status is on.
 
 These samples use distance/time units (described in ``HKUnit``) and measure discrete values (described in ``HKQuantityAggregationStyle``).
 For example, the following code shows two ways to create a meters/second unit.
 The first uses explicit constructors, while the second initializes the unit from a string.
 ```
 let mps = HKUnit.meter().unitDivided(by: HKUnit.second())
 let mpsFromString = HKUnit(from: "m/s")
 ```
 The sample’s ``quantity`` property represents the average descent speed between the sample’s ``startDate`` and ``endDate`` properties.

 The default unit is meter per second.
 */
public struct StairDescentSpeed: HKDiscreteQuantity {

    public static let quantityTypeIdentifier: HKQuantityTypeIdentifier = .stairDescentSpeed

    /// m/s
    public static let defaultUnit: HKUnit = .meter().unitDivided(by: .second())

    public let discreteQuantitySample: HKDiscreteQuantitySample

    public init(discreteQuantitySample: HKDiscreteQuantitySample) {
        self.discreteQuantitySample = discreteQuantitySample
    }
}

