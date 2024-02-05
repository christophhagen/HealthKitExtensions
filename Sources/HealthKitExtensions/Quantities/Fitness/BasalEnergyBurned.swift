import Foundation
import HealthKit

public struct BasalEnergyBurnedSpecification: HKQuantityTypeSpecification {

    public static let identifier: HKQuantityTypeIdentifier = .basalEnergyBurned

    /// joule
    public static let defaultUnit: HKUnit = .joule()
}

/**
 A quantity sample type that measures the resting energy burned by the user.
 
 Resting energy is the energy that the user’s body burns to maintain its normal, resting state.
 The body uses this energy to perform basic functions like breathing, circulating blood, and managing the growth and maintenance of cells.
 These samples use energy units (described in ``HKUnit``) and measure cumulative values (described in ``HKQuantityAggregationStyle``).

 The default unit is Joule.
 */
public typealias BasalEnergyBurned = HKQuantityValue<BasalEnergyBurnedSpecification>
