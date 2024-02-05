import Foundation
import HealthKit

public struct InsulinDeliverySpecification: HKQuantityTypeSpecification {

    public static let identifier: HKQuantityTypeIdentifier = .insulinDelivery

    /// IU
    public static let defaultUnit: HKUnit = .internationalUnit()
}

/**
 A quantity sample that measures the amount of insulin delivered.

 These samples use international units (IU) (described in ``HKUnit``) and measure cumulative values (described in ``HKQuantityAggregationStyle``).

 The default unit is IU.
 */
public typealias InsulinDelivery = HKQuantityValue<InsulinDeliverySpecification>
