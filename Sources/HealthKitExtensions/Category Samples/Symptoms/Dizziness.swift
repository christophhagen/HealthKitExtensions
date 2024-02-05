import Foundation
import HealthKit

@available(iOS 13.6, *)
public struct DizzinessIdentifier: HKCategoryTypeIdentifierProvider {
    public static let identifier: HKCategoryTypeIdentifier = .dizziness
}

/**
 A category type that records dizziness as a symptom.

 These samples use values from the ``HKCategoryValueSeverity`` enumeration.
 */
@available(iOS 13.6, *)
public typealias Dizziness = HKCategoryValueSeveritySample<DizzinessIdentifier>

