import Foundation
import HealthKit

public struct StepCountSpecification: HKQuantityTypeSpecification {

    public static let identifier: HKQuantityTypeIdentifier = .stepCount

    /// count
    public static let defaultUnit: HKUnit = .count()
}

/**
 A quantity sample type that measures the number of steps the user has taken.

 These samples use count units (described in ``HKUnit``) and measure cumulative values (described in ``HKQuantityAggregationStyle``).

 The default unit is count.
 */
public typealias StepCount = HKQuantityValue<StepCountSpecification>
