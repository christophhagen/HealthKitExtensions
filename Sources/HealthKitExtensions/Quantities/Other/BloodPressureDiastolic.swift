import Foundation
import HealthKit

/**
 A quantity sample type that measures the user’s diastolic blood pressure.

 When recording blood pressure, combine systolic and diastolic samples into a single correlation object (described in bloodPressure).
 These samples use pressure units (described in ``HKUnit``) and measure discrete values (described in ``HKQuantityAggregationStyle``).

 The default unit is mmHg.
 */
public struct BloodPressureDiastolic: HKDiscreteQuantity {

    public static let quantityTypeIdentifier: HKQuantityTypeIdentifier = .bloodPressureDiastolic

    /// mmHg
    public static let defaultUnit: HKUnit = .millimeterOfMercury()

    public let discreteQuantitySample: HKDiscreteQuantitySample

    public init(discreteQuantitySample: HKDiscreteQuantitySample) {
        self.discreteQuantitySample = discreteQuantitySample
    }
}
