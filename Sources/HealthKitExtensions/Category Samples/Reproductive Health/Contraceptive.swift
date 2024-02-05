import Foundation
import HealthKit

extension HKCategoryValueContraceptive: HKCategoryTypeIdentifierProvider {
    public static let identifier: HKCategoryTypeIdentifier = .contraceptive
}

/**
 A category sample type that records the use of contraceptives.
 
 Samples of this type use values from the ``HKCategoryValueContraceptive`` enumeration.
 */
public typealias Contraceptive = HKCategoryEnumSample<HKCategoryValueContraceptive>
