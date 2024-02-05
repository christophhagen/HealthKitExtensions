import Foundation
import HealthKit

@available(iOS 17.0, macOS 14.0, watchOS 10.0, *)
public struct CyclingCadenceSpecification: HKQuantityTypeSpecification {

    public static let identifier: HKQuantityTypeIdentifier = .cyclingCadence

    /// revolutions per minute
    public static let defaultUnit: HKUnit = .count().unitDivided(by: .minute())
}

/**
 A quantity sample type that measures the cycling cadence by the user.

 The default unit is revolutions per minute.
 */
@available(iOS 17.0, macOS 14.0, watchOS 10.0, *)
public typealias CyclingCadence = HKQuantityValue<CyclingCadenceSpecification>
