import Foundation
import HealthKit

/**
 A quantity sample type that measures the user’s systolic blood pressure.

 Systolic blood pressure measures the maximum blood pressure during each heart beat. 
 When recording blood pressure, combine systolic and diastolic samples into a single correlation object (described in ``bloodPressure``).

 The default unit is mmHg.
 */
public struct BloodPressureSystolic: HKDiscreteQuantity {

    public static let quantityTypeIdentifier: HKQuantityTypeIdentifier = .bloodPressureSystolic

    /// mmHg
    public static let defaultUnit: HKUnit = .millimeterOfMercury()

    public let discreteQuantitySample: HKDiscreteQuantitySample

    public init(discreteQuantitySample: HKDiscreteQuantitySample) {
        self.discreteQuantitySample = discreteQuantitySample
    }
}
