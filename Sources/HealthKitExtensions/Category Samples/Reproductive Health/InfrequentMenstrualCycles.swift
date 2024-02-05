import Foundation
import HealthKit

@available(iOS 16.0, watchOS 9.0, *)
public struct InfrequentMenstrualCyclesIdentifier: HKCategoryTypeIdentifierProvider {
    public static let identifier: HKCategoryTypeIdentifier = .infrequentMenstrualCycles
}

/**
 A category sample that indicates an infrequent menstrual cycle.

 HealthKit generates Cycle Deviation notifications based on the cycle data a person enters.
 HealthKit processes this data on their iOS device. If it detects a potential deviation, it sends a notification asking them to verify their logged cycle history.
 If the person confirms that their cycle history is accurate, HealthKit saves a corresponding sample of the detected Cycle Deviation to the HealthKit store.

 Cycle Deviation notifications include:

 Persistent spotting
    Persistent spotting, also known as irregular intermenstrual bleeding, is defined as spotting that occurs in at least two of your cycles in the last six months.
    HealthKit records verified instances using ``persistentIntermenstrualBleeding`` samples.

 Prolonged periods
    Prolonged periods are defined as menstrual bleeding that lasts for ten or more days, and this has happened at least two times in the last six months.
    HealthKit records verified instances using ``prolongedMenstrualPeriods`` samples.

 Irregular cycles
    An irregular cycle is defined as at least a seventeen-day difference between a person’s shortest and longest cycles over the last six months.
    HealthKit records verified instances using ``irregularMenstrualCycles`` samples.

 Infrequent periods
    An infrequent period is defined as having a period one or two times in the last six months.
    HealthKit records verified instances using ``infrequentMenstrualCycles`` samples.

 Use a ``HKCategoryValue.notApplicable`` value with these samples.

 - Important These samples are read-only. You can request permission to read the samples using this identifier, but you can’t request authorization to share them. This means you can’t save new infrequent menstrual cycle samples to the HealthKit store.
 */
@available(iOS 16.0, watchOS 9.0, *)
public typealias InfrequentMenstrualCycles = HKCategoryEmptySample<InfrequentMenstrualCyclesIdentifier>
