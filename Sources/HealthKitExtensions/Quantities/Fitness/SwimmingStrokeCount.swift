import Foundation
import HealthKit

public struct SwimmingStrokeCountSpecification: HKQuantityTypeSpecification {

    public static let identifier: HKQuantityTypeIdentifier = .swimmingStrokeCount

    /// count
    public static let defaultUnit: HKUnit = .count()
}

/**
 A quantity sample type that measures the number of strokes performed while swimming.

 These samples use count units (described in ``HKUnit``) and measure cumulative values (described in ``HKQuantityAggregationStyle``).

 The default unit is count.
 */
public typealias SwimmingStrokeCount = HKQuantityValue<SwimmingStrokeCountSpecification>
