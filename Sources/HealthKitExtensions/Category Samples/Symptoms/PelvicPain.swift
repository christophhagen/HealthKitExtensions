import Foundation
import HealthKit

@available(iOS 13.6, *)
public struct PelvicPainIdentifier: HKCategoryTypeIdentifierProvider {
    public static let identifier: HKCategoryTypeIdentifier = .pelvicPain
}

/**
 A category type that records pelvic pain as a symptom.

 These samples use values from the ``HKCategoryValueSeverity`` enumeration.
 */
@available(iOS 13.6, *)
public typealias PelvicPain = HKCategoryValueSeveritySample<PelvicPainIdentifier>

