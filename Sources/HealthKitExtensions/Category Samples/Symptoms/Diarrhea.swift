import Foundation
import HealthKit

@available(iOS 13.6, *)
public struct DiarrheaIdentifier: HKCategoryTypeIdentifierProvider {
    public static let identifier: HKCategoryTypeIdentifier = .diarrhea
}

/**
 A category type that records diarrhea as a symptom.

 These samples use values from the ``HKCategoryValueSeverity`` enumeration.
 */
@available(iOS 13.6, *)
public typealias Diarrhea = HKCategoryValueSeveritySample<DiarrheaIdentifier>

