import Foundation
import HealthKit

@available(iOS 13.6, *)
extension HKCategoryValueAppetiteChanges: HKCategoryTypeIdentifierProvider {
    public static let identifier: HKCategoryTypeIdentifier = .appetiteChanges
}

/**
 A category type that records changes in appetite as a symptom.

 These samples use values from the ``HKCategoryValueAppetiteChanges`` enumeration.
 */
public typealias AppetiteChanges = HKCategoryEnumSample<HKCategoryValueAppetiteChanges>

