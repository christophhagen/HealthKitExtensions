import Foundation
import HealthKit

public struct BloodPressureDiastolicSpecification: HKQuantityTypeSpecification {

    public static let identifier: HKQuantityTypeIdentifier = .bloodPressureDiastolic

    /// mmHg
    public static let defaultUnit: HKUnit = .millimeterOfMercury()
}

/**
 A quantity sample type that measures the user’s diastolic blood pressure.

 When recording blood pressure, combine systolic and diastolic samples into a single correlation object (described in bloodPressure).
 These samples use pressure units (described in ``HKUnit``) and measure discrete values (described in ``HKQuantityAggregationStyle``).

 The default unit is mmHg.
 */
public typealias BloodPressureDiastolic = HKQuantityValue<BloodPressureDiastolicSpecification>
