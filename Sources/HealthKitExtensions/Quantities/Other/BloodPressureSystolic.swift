import Foundation
import HealthKit

public struct BloodPressureSystolicSpecification: HKQuantityTypeSpecification {

    public static let identifier: HKQuantityTypeIdentifier = .bloodPressureSystolic

    /// mmHg
    public static let defaultUnit: HKUnit = .millimeterOfMercury()
}

/**
 A quantity sample type that measures the user’s systolic blood pressure.

 Systolic blood pressure measures the maximum blood pressure during each heart beat. 
 When recording blood pressure, combine systolic and diastolic samples into a single correlation object (described in ``bloodPressure``).

 The default unit is mmHg.
 */
public typealias BloodPressureSystolic = HKDiscreteQuantityValue<BloodPressureSystolicSpecification>
