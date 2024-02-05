import Foundation
import HealthKit

@available(iOS 13.6, *)
public struct BreastPainIdentifier: HKCategoryTypeIdentifierProvider {
    public static let identifier: HKCategoryTypeIdentifier = .breastPain
}

/**
 A category type that records breast pain as a symptom.

 These samples use values from the ``HKCategoryValueSeverity`` enumeration.
 */
@available(iOS 13.6, *)
public typealias BreastPain = HKCategoryValueSeveritySample<BreastPainIdentifier>

