import Foundation
import HealthKit

@available(iOS 17.0, macOS 14.0, watchOS 10.0, *)
public struct TimeInDaylightSpecification: HKQuantityTypeSpecification {

    public static let identifier: HKQuantityTypeIdentifier = .timeInDaylight

    /// minute
    public static let defaultUnit: HKUnit = .minute()
}

/**

 The default unit is minute.
 */
@available(iOS 17.0, macOS 14.0, watchOS 10.0, *)
public typealias TimeInDaylight = HKCumulativeQuantityValue<TimeInDaylightSpecification>
