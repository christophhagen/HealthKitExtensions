import Foundation
import HealthKit

public struct WalkingSpeedSpecification: HKQuantityTypeSpecification {

    public static let identifier: HKQuantityTypeIdentifier = .walkingSpeed

    /// m/s
    public static let defaultUnit: HKUnit = .meter().unitDivided(by: .second())
}

/**
 A quantity sample type that measures the user’s average speed when walking steadily over flat ground.

 Walking speed represents how quickly the user walks on flat ground. 
 The system automatically records walking speed samples on iPhone 8 or later. 
 The user must carry their phone near their waist—such as in a pocket—and walk steadily on flat ground.
 To ensure accuracy, the user’s ``height`` value must be up to date.
 The system records 10 to 30 walking speed samples on a typical day.
 iPhone doesn’t record walking speed samples if the user’s wheelchair status is on.
 
 These samples use distance per time units (described in ``HKUnit``) and measure discrete values (described in ``HKQuantityAggregationStyle``).
 For example, the following code shows two ways to create a meters per second unit.
 The first uses explicit constructors, while the second initializes the unit from a string.
 ```
 let mps = HKUnit.meter().unitDivided(by: HKUnit.second())
 let mpsFromString = HKUnit(from: "m/s")
 ```

 The sample’s ``quantity`` property represents the average walking speed between the sample’s ``startDate`` and ``endDate`` properties.

 The default unit is meters per seconds.
 */
public typealias WalkingSpeed = HKQuantityValue<WalkingSpeedSpecification>

