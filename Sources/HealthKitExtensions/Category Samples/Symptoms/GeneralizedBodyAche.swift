import Foundation
import HealthKit

@available(iOS 13.6, *)
public struct GeneralizedBodyAcheIdentifier: HKCategoryTypeIdentifierProvider {
    public static let identifier: HKCategoryTypeIdentifier = .generalizedBodyAche
}

/**
 A category type that records body ache as a symptom.

 These samples use values from the ``HKCategoryValueSeverity`` enumeration.
 */
@available(iOS 13.6, *)
public typealias GeneralizedBodyAche = HKCategoryValueSeveritySample<GeneralizedBodyAcheIdentifier>

