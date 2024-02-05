import Foundation
import HealthKit

@available(iOS 17.0, macOS 14.0, watchOS 10.0, *)
public struct PhysicalEffortSpecification: HKQuantityTypeSpecification {

    public static let identifier: HKQuantityTypeIdentifier = .physicalEffort

    /// `kcal/(kg*hr)`
    public static let defaultUnit: HKUnit = .largeCalorie().unitDivided(by: .gramUnit(with: .kilo)).unitDivided(by: .hour())
}

/**
 A quantity sample type that measures the number of PhysicalEffort points the user has earned.

 These samples use count units (described in ``HKUnit``) and measure discrete values (described in ``HKQuantityAggregationStyle``).

 The default unit is `kcal/(kg*hr)`.
 */
@available(iOS 17.0, macOS 14.0, watchOS 10.0, *)
public typealias PhysicalEffort = HKQuantityValue<PhysicalEffortSpecification>
