import Foundation
import HealthKit

@available(iOS 17.0, macOS 14.0, watchOS 10.0, *)
public struct CyclingFunctionalThresholdPowerSpecification: HKQuantityTypeSpecification {

    public static let identifier: HKQuantityTypeIdentifier = .cyclingFunctionalThresholdPower

    /// watt
    public static let defaultUnit: HKUnit = .watt()
}

/**
 The default unit is Watt.
 */
@available(iOS 17.0, macOS 14.0, watchOS 10.0, *)
public typealias CyclingFunctionalThresholdPower = HKQuantityValue<CyclingFunctionalThresholdPowerSpecification>
