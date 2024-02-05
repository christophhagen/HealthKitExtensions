import Foundation
import HealthKit

@available(iOS 13.6, *)
public struct HeartburnIdentifier: HKCategoryTypeIdentifierProvider {
    public static let identifier: HKCategoryTypeIdentifier = .heartburn
}

/**
 A category type that records heartburn as a symptom.

 These samples use values from the ``HKCategoryValueSeverity`` enumeration.
 */
@available(iOS 13.6, *)
public typealias Heartburn = HKCategoryValueSeveritySample<HeartburnIdentifier>
