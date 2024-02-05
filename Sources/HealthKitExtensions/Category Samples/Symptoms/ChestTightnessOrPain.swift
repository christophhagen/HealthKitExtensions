import Foundation
import HealthKit

@available(iOS 13.6, *)
public struct ChestTightnessOrPainIdentifier: HKCategoryTypeIdentifierProvider {
    public static let identifier: HKCategoryTypeIdentifier = .chestTightnessOrPain
}

/**
 A category type that records chest tightness or pain as a symptom.

 These samples use values from the ``HKCategoryValueSeverity`` enumeration.
 */
@available(iOS 13.6, *)
public typealias ChestTightnessOrPain = HKCategoryValueSeveritySample<ChestTightnessOrPainIdentifier>

