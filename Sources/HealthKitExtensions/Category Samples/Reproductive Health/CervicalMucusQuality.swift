import Foundation
import HealthKit

/**
 A category sample type that records the quality of the user’s cervical mucus.
 
 These samples use values from the ``HKCategoryValueCervicalMucusQuality`` enum.
 */
public struct CervicalMucusQuality: HKCategoryEnumSample {

    public typealias Value = HKCategoryValueCervicalMucusQuality

    public static let categoryTypeIdentifier: HKCategoryTypeIdentifier = .cervicalMucusQuality

    public let categorySample: HKCategorySample

    public init(categorySample: HKCategorySample) {
        self.categorySample = categorySample
    }
}
