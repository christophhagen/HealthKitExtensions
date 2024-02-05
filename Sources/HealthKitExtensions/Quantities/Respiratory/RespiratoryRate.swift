import Foundation
import HealthKit

public struct RespiratoryRateSpecification: HKQuantityTypeSpecification {

    public static let identifier: HKQuantityTypeIdentifier = .respiratoryRate

    /// count/s
    public static let defaultUnit: HKUnit = .count().unitDivided(by: .second())
}

/**
 A quantity sample type that measures the user’s respiratory rate.

 These samples use count/time units (described in ``HKUnit``) and measure discrete values (described in ``HKQuantityAggregationStyle``).

 The default unit is count/s.
 */
public typealias RespiratoryRate = HKQuantityValue<RespiratoryRateSpecification>
