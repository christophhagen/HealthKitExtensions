import Foundation
import HealthKit

extension HKCategoryValueCervicalMucusQuality: HKCategoryTypeIdentifierProvider {
    public static let identifier: HKCategoryTypeIdentifier = .cervicalMucusQuality
}

/**
 A category sample type that records the quality of the user’s cervical mucus.
 
 These samples use values from the ``HKCategoryValueCervicalMucusQuality`` enum.
 */
public typealias CervicalMucusQuality = HKCategoryEnumSample<HKCategoryValueCervicalMucusQuality>
