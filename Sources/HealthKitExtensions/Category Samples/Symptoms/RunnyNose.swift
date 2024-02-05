import Foundation
import HealthKit

@available(iOS 13.6, *)
public struct RunnyNoseIdentifier: HKCategoryTypeIdentifierProvider {
    public static let identifier: HKCategoryTypeIdentifier = .runnyNose
}

/**
 A category type that records runny nose as a symptom.

 These samples use values from the ``HKCategoryValueSeverity`` enumeration.
 */
@available(iOS 13.6, *)
public typealias RunnyNose = HKCategoryValueSeveritySample<RunnyNoseIdentifier>
