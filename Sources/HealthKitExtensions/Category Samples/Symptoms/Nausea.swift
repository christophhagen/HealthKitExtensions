import Foundation
import HealthKit

@available(iOS 13.6, *)
public struct NauseaIdentifier: HKCategoryTypeIdentifierProvider {
    public static let identifier: HKCategoryTypeIdentifier = .nausea
}

/**
 A category type that records nausea as a symptom.

 These samples use values from the ``HKCategoryValueSeverity`` enumeration.
 */
@available(iOS 13.6, *)
public typealias Nausea = HKCategoryValueSeveritySample<NauseaIdentifier>
