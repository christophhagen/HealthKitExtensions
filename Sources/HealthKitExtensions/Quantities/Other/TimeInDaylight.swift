import Foundation
import HealthKit

/**

 The default unit is minute.
 */
@available(iOS 17.0, macOS 14.0, watchOS 10.0, *)
public struct TimeInDaylight: HKCumulativeQuantity {

    public static let quantityTypeIdentifier: HKQuantityTypeIdentifier = .timeInDaylight

    public static var defaultUnit: HKUnit = .minute()

    public let cumulativeQuantitySample: HKCumulativeQuantitySample

    public init(cumulativeQuantitySample: HKCumulativeQuantitySample) {
        self.cumulativeQuantitySample = cumulativeQuantitySample
    }
}
