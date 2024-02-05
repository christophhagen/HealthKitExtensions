import Foundation
import HealthKit

@available(iOS 13.6, *)
public struct AcneIdentifier: HKCategoryTypeIdentifierProvider {
    public static let identifier: HKCategoryTypeIdentifier = .acne
}

/**
 A category type that records acne as a symptom.

 These samples use values from the ``HKCategoryValueSeverity`` enumeration.
 */
public typealias Acne = HKCategoryValueSeveritySample<AcneIdentifier>
