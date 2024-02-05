import Foundation
import HealthKit

public struct LeanBodyMassSpecification: HKQuantityTypeSpecification {

    public static let identifier: HKQuantityTypeIdentifier = .leanBodyMass

    /// Kg
    public static let defaultUnit: HKUnit = .gramUnit(with: .kilo)
}

/**
 A quantity sample type that measures the user’s lean body mass.
 
 These samples use mass units (described in ``HKUnit``) and measure discrete values (described in ``HKQuantityAggregationStyle``).

 The default unit is kilograms.
 */
public typealias LeanBodyMass = HKQuantityValue<LeanBodyMassSpecification>
