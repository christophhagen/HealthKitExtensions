import Foundation
import HealthKit

/**
 A category sample type that records the use of contraceptives.
 
 Samples of this type use values from the ``HKCategoryValueContraceptive`` enumeration.
 */
public struct Contraceptive: HKCategoryEnumSample {

    public typealias Value = HKCategoryValueContraceptive

    public static let categoryTypeIdentifier: HKCategoryTypeIdentifier = .contraceptive

    public let categorySample: HKCategorySample

    public init(categorySample: HKCategorySample) {
        self.categorySample = categorySample
    }
}
