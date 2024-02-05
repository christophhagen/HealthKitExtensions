import Foundation
import HealthKit

public struct BodyMassSpecification: HKQuantityTypeSpecification {

    public static let identifier: HKQuantityTypeIdentifier = .bodyMass

    /// Kg
    public static let defaultUnit: HKUnit = .gramUnit(with: .kilo)
}

/**
 A quantity sample type that measures the user’s weight.
 
 These samples use mass units (described in ``HKUnit``) and measure discrete values (described in ``HKQuantityAggregationStyle``).
 
 The default unit is kilograms.
 */
public typealias BodyMass = HKQuantityValue<BodyMassSpecification>
