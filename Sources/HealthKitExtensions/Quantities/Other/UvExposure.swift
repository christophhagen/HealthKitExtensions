import Foundation
import HealthKit

public struct UvExposureSpecification: HKQuantityTypeSpecification {

    public static let identifier: HKQuantityTypeIdentifier = .uvExposure

    /// count
    public static let defaultUnit: HKUnit = .count()
}

/**
 A quantity sample type that measures the user’s exposure to UV radiation.

 These samples use count units (described in ``HKUnit``) and measure discrete values (described in ``HKQuantityAggregationStyle``).
 The sample’s value represents the UV index that the user was exposed to during the sample’s duration.

 The default unit is count.
 */
public typealias UvExposure = HKDiscreteQuantityValue<UvExposureSpecification>
