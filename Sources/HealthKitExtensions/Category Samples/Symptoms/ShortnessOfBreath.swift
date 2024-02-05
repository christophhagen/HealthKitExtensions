import Foundation
import HealthKit

@available(iOS 13.6, *)
public struct ShortnessOfBreathIdentifier: HKCategoryTypeIdentifierProvider {
    public static let identifier: HKCategoryTypeIdentifier = .shortnessOfBreath
}

/**
 A category type that records shortness of breath as a symptom.

 These samples use values from the ``HKCategoryValueSeverity`` enumeration.
 */
@available(iOS 13.6, *)
public typealias ShortnessOfBreath = HKCategoryValueSeveritySample<ShortnessOfBreathIdentifier>
