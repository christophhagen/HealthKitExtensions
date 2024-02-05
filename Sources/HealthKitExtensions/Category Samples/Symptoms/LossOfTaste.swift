import Foundation
import HealthKit

@available(iOS 13.6, *)
public struct LossOfTasteIdentifier: HKCategoryTypeIdentifierProvider {
    public static let identifier: HKCategoryTypeIdentifier = .lossOfTaste
}

/**
 A category type that records loss of taste as a symptom.

 These samples use values from the ``HKCategoryValueSeverity`` enumeration.
 */
@available(iOS 13.6, *)
public typealias LossOfTaste = HKCategoryValueSeveritySample<LossOfTasteIdentifier>
