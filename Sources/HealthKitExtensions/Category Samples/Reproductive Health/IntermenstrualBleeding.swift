import Foundation
import HealthKit

public struct IntermenstrualBleedingIdentifier: HKCategoryTypeIdentifierProvider {
    public static let identifier: HKCategoryTypeIdentifier = .intermenstrualBleeding
}

/**
 A category sample type that records spotting outside the normal menstruation period.
 
 Use a ``HKCategoryValue.notApplicable`` value with these samples.
 */
public typealias IntermenstrualBleeding = HKCategoryEmptySample<IntermenstrualBleedingIdentifier>
