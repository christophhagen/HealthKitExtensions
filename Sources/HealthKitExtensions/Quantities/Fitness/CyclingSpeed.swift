import Foundation
import HealthKit

@available(iOS 17.0, macOS 14.0, watchOS 10.0, *)
public struct CyclingSpeedSpecification: HKQuantityTypeSpecification {

    public static let identifier: HKQuantityTypeIdentifier = .cyclingSpeed

    /// m/s
    public static let defaultUnit: HKUnit = .meter().unitDivided(by: .second())
}

/**
 The default unit is meter per second.
 */
@available(iOS 17.0, macOS 14.0, watchOS 10.0, *)
public typealias CyclingSpeed = HKQuantityValue<CyclingSpeedSpecification>
