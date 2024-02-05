import Foundation
import HealthKit

public struct BloodGlucoseSpecification: HKQuantityTypeSpecification {

    public static let identifier: HKQuantityTypeIdentifier = .bloodGlucose

    /// mg/dL
    public static let defaultUnit: HKUnit = .gramUnit(with: .milli).unitDivided(by: .literUnit(with: .deci))
}

/**
 A quantity sample type that measures the user’s blood glucose level.

 These samples use mass/volume units (described in ``HKUnit``) and measure discrete values (described in ``HKQuantityAggregationStyle``).

 Please pay attention to the following issues while creating blood glucose samples:
 - Blood glucose samples may be measured in mg/dL (milligrams per deciliter) or mmol/L (millimoles per liter), depending on the region.
 - The Health app lets users select their preferred units. 
 The Health app uses these units for both the display and manual entry of blood glucose samples.
 - You can access the preferred units using the ``preferredUnits(for:completion:)`` method.
 If your app connects to a glucose meter that uses units other than the preferred units, alert the user.
 You can also recommend that users change their preferred units to match the glucose meter.
 - Don’t save samples to HealthKit when the blood glucose meter is processing control solution.

 The default unit is mg/dL.
 */
public typealias BloodGlucose = HKQuantityValue<BloodGlucoseSpecification>
