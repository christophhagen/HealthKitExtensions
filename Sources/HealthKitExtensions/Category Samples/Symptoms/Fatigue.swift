import Foundation
import HealthKit

@available(iOS 13.6, *)
public struct FatigueIdentifier: HKCategoryTypeIdentifierProvider {
    public static let identifier: HKCategoryTypeIdentifier = .fatigue
}

/**
 A category type that records fatigue as a symptom.

 These samples use values from the ``HKCategoryValueSeverity`` enumeration.
 */
@available(iOS 13.6, *)
public typealias Fatigue = HKCategoryValueSeveritySample<FatigueIdentifier>

