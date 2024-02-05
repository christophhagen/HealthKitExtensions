import Foundation
import HealthKit

@available(iOS 13.6, *)
public struct LowerBackPainIdentifier: HKCategoryTypeIdentifierProvider {
    public static let identifier: HKCategoryTypeIdentifier = .lowerBackPain
}

/**
 A category type that records lower back pain as a symptom.

 These samples use values from the ``HKCategoryValueSeverity`` enumeration.
 */
@available(iOS 13.6, *)
public typealias LowerBackPain = HKCategoryValueSeveritySample<LowerBackPainIdentifier>
