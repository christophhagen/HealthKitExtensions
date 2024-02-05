import Foundation
import HealthKit

public struct PregnancyIdentifier: HKCategoryTypeIdentifierProvider {
    public static let identifier: HKCategoryTypeIdentifier = .pregnancy
}

/**
 A category type that records pregnancy.
 
 Use a ``HKCategoryValue.notApplicable`` value with samples of this type.
 */
public typealias Pregnancy = HKCategoryEmptySample<PregnancyIdentifier>
