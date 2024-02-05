import Foundation
import HealthKit

public struct ActiveEnergyBurnedSpecification: HKQuantityTypeSpecification {

    public static let identifier: HKQuantityTypeIdentifier = .activeEnergyBurned

    /// joule
    public static let defaultUnit: HKUnit = .joule()
}

/**
 A quantity sample type that measures the amount of active energy the user has burned.
 
 Active energy is the energy that the user has burned due to physical activity and exercise. 
 These samples should not include the resting energy burned during the sample’s duration.
 Use the health store's ``splitTotalEnergy(_:start:end:resultsHandler:)`` method to split a workout's total energy burned into the active and resting portions, and then save each portion in its own sample.

 Active energy samples use energy units (described in ``HKUnit``) and measure cumulative values (described in ``HKQuantityAggregationStyle``).

 The default unit is Joule.
 */
public typealias ActiveEnergyBurned = HKQuantityValue<ActiveEnergyBurnedSpecification>
