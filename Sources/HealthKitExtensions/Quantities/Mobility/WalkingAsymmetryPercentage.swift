import Foundation
import HealthKit

public struct WalkingAsymmetryPercentageSpecification: HKQuantityTypeSpecification {

    public static let identifier: HKQuantityTypeIdentifier = .walkingAsymmetryPercentage

    /// percent
    public static let defaultUnit: HKUnit = .percent()
}

/**
 A quantity sample type that measures the percentage of steps in which one foot moves at a different speed than the other when walking on flat ground.

 Walking asymmetry is the percent of time that a user’s steps with one foot are faster or slower than the other foot. 
 The system automatically records walking asymmetry samples on iPhone 8 or later.
 The user must carry their phone near their waist—such as in a pocket—and walk steadily on flat ground.
 The system records the phone’s location using the ``HKMetadataKeyDevicePlacementSide`` metadata key.
 The system records 10 to 30 walking asymmetry samples on a typical day.
 iPhone doesn’t record walking asymmetry samples if the user’s wheelchair status is on.
 
 These samples use percentage units (described in ``HKUnit``) and measure discrete values (described in ``HKQuantityAggregationStyle``).
 For example, the following code creates a percentage unit.
 ```
 let percentage = HKUnit.percent()
 ```
 The sample’s ``quantity`` property represents the percent of asymmetrical steps between the sample’s ``startDate`` and ``endDate`` properties.

 The default unit is percent.
 */
public typealias WalkingAsymmetryPercentage = HKQuantityValue<WalkingAsymmetryPercentageSpecification>

extension WalkingAsymmetryPercentage {

    /**
     Indicates the placement of the device that measured a sample.
     */
    var devicePlacementSide: HKDevicePlacementSide? {
        guard let number: NSNumber = metadata?[.devicePlacementSide] else {
            return nil
        }
        return .init(rawValue: number.intValue)
    }
}
