import Foundation
import HealthKit

public struct LactationIdentifier: HKCategoryTypeIdentifierProvider {
    public static let identifier: HKCategoryTypeIdentifier = .lactation
}

/**
 A category type that records lactation.
 
 Use a ``HKCategoryValue.notApplicable`` value with samples of this type.
 */
public typealias Lactation = HKCategoryEmptySample<LactationIdentifier>
