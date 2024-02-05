import Foundation
import HealthKit

public struct AppleStandTimeSpecification: HKQuantityTypeSpecification {

    public static let identifier: HKQuantityTypeIdentifier = .appleStandTime

    /// seconds
    public static let defaultUnit: HKUnit = .second()
}

/**
 A quantity sample type that measures the amount of time the user has spent standing.
 
 These samples use time units (described in ``HKUnit``) and measure cumulative values (described in ``HKQuantityAggregationStyle``).

 The default unit is seconds.
 */
public typealias AppleStandTime = HKQuantityValue<AppleStandTimeSpecification>
