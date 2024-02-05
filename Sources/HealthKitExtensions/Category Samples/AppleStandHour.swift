import Foundation
import HealthKit

extension HKCategoryValueAppleStandHour: HKCategoryTypeIdentifierProvider {
    public static let identifier: HKCategoryTypeIdentifier = .appleStandHour
}

/**
 A category sample type that counts the number of hours in the day during which the user has stood and moved for at least one minute per hour.

 This quantity type counts the number of hours during which the user stood and moved for at least one minute per hour.
 If ``wheelchairUse()`` returns ``HKWheelchairUse.yes``, Apple Watch calculates the number of hours during which the user rolled for at least one minute instead.
 Also, the Activity rings display Roll hours instead of Stand hours.

 - Note: Roll hours are recorded using the `appleStandHours` quantity type. Check the ``wheelchairUse()`` method’s return value to determine whether the data should be interpreted as Roll or Stand hours.

 These samples use values from the ``HKCategoryValueAppleStandHour`` enumeration.
 They represent the data tracked by the Stand ring on Apple Watch.
 */
public typealias AppleStandHour = HKCategoryEnumSample<HKCategoryValueAppleStandHour>


