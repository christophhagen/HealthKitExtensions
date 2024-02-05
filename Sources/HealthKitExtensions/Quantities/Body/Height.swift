import Foundation
import HealthKit

public struct HeightSpecification: HKQuantityTypeSpecification {

    public static let identifier: HKQuantityTypeIdentifier = .height

    /// meter
    public static let defaultUnit: HKUnit = .meter()
}

/**
 A quantity sample type that measures the user’s height.
 
 These samples use length units (described in ``HKUnit``) and measure discrete values (described in ``HKQuantityAggregationStyle``).

 The default unit is meter.
 */
public typealias Height = HKQuantityValue<HeightSpecification>
