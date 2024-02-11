import Foundation
import HealthKit

public struct BodyMassIndexSpecification: HKQuantityTypeSpecification {

    public static let identifier: HKQuantityTypeIdentifier = .bodyMassIndex

    /// Count
    public static let defaultUnit: HKUnit = .count()
}

/**
 A quantity sample type that measures the user’s body mass index.
 
 These samples use count units (described in ``HKUnit``) and measure discrete values (described in ``HKQuantityAggregationStyle``).

 The default unit is counts.
 */
public typealias BodyMassIndex = HKDiscreteQuantityValue<BodyMassIndexSpecification>
