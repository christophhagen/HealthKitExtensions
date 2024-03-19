import Foundation
import HealthKit

/**
 A quantity sample that measures the amount of insulin delivered.

 These samples use international units (IU) (described in ``HKUnit``) and measure cumulative values (described in ``HKQuantityAggregationStyle``).

 The default unit is IU.
 */
public struct InsulinDelivery: HKCumulativeQuantity {

    public static let quantityTypeIdentifier: HKQuantityTypeIdentifier = .insulinDelivery

    public static var defaultUnit: HKUnit = .internationalUnit()

    public let cumulativeQuantitySample: HKCumulativeQuantitySample

    public init(cumulativeQuantitySample: HKCumulativeQuantitySample) {
        self.cumulativeQuantitySample = cumulativeQuantitySample
    }
}

extension InsulinDelivery {

    /// The medical reason for administering insulin.
    var reason: HKInsulinDeliveryReason? {
        metadata?.insulinDeliveryReason
    }

    public init(amount: Double, reason: HKInsulinDeliveryReason, start: Date, end: Date, uuid: UUID? = nil, device: HKDevice? = nil, metadata: [String : Any]? = nil) {
        var metadata = metadata ?? [:]
        metadata.insulinDeliveryReason = reason
        self.init(value: amount, start: start, end: end, uuid: uuid, device: device, metadata: metadata)
    }
}
