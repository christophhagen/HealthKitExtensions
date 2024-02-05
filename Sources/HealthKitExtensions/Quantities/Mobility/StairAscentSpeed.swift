import Foundation
import HealthKit

public struct StairAscentSpeedSpecification: HKQuantityTypeSpecification {

    public static let identifier: HKQuantityTypeIdentifier = .stairAscentSpeed

    /// m/s
    public static let defaultUnit: HKUnit = .meter().unitDivided(by: .second())
}

/**
 A quantity sample type measuring the user’s speed while climbing a flight of stairs.

 This is a measurement of how fast the user walks up stairs. 
 The system automatically records stair ascent samples on Apple Watch Series 5 or later.
 The user must climb a 10-foot (3-meter) flight of steps while wearing the watch.
 The system records 20 samples on a typical day; however, some days may go over 100 samples, for example if the user goes on a long hike.
 The watch doesn’t record stair ascent speed samples if the user’s wheelchair status is on.
 
 These samples use distance/time units (described in ``HKUnit``) and measure discrete values (described in ``HKQuantityAggregationStyle``).
 For example, the following code shows two ways to create a meters/second unit. 
 The first uses explicit constructors, while the second initializes the unit from a string.
 ```
 let mps = HKUnit.meter().unitDivided(by: HKUnit.second())
 let mpsFromString = HKUnit(from: "m/s")
 ```
 The sample’s ``quantity`` property represents the average ascent speed between the sample’s ``startDate`` and ``endDate`` properties.

 The default unit is meter per second.
 */
public typealias StairAscentSpeed = HKQuantityValue<StairAscentSpeedSpecification>

