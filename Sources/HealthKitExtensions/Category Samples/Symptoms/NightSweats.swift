import Foundation
import HealthKit

@available(iOS 14.0, *)
public struct NightSweatsIdentifier: HKCategoryTypeIdentifierProvider {
    public static let identifier: HKCategoryTypeIdentifier = .nightSweats
}

/**
 A category type that records night sweats as a symptom.

 These samples use values from the ``HKCategoryValueSeverity`` enumeration.
 */
@available(iOS 14.0, *)
public typealias NightSweats = HKCategoryValueSeveritySample<NightSweatsIdentifier>
