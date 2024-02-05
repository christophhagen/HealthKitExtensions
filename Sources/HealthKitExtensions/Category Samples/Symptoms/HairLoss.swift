import Foundation
import HealthKit

@available(iOS 14.0, *)
public struct HairLossIdentifier: HKCategoryTypeIdentifierProvider {
    public static let identifier: HKCategoryTypeIdentifier = .hairLoss
}

/**
 A category type that records hair loss as a symptom.

 These samples use values from the ``HKCategoryValueSeverity`` enumeration.
 */
@available(iOS 14.0, *)
public typealias HairLoss = HKCategoryValueSeveritySample<HairLossIdentifier>

