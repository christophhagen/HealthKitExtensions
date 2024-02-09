import Foundation
import HealthKit

public struct InsulinDeliverySpecification: HKQuantityTypeSpecification {

    public static let identifier: HKQuantityTypeIdentifier = .insulinDelivery

    /// IU
    public static let defaultUnit: HKUnit = .internationalUnit()
}

/**
 A quantity sample that measures the amount of insulin delivered.

 These samples use international units (IU) (described in ``HKUnit``) and measure cumulative values (described in ``HKQuantityAggregationStyle``).

 The default unit is IU.
 */
public typealias InsulinDelivery = HKQuantityValue<InsulinDeliverySpecification>

extension InsulinDelivery {

    /// The medical reason for administering insulin.
    var reason: HKInsulinDeliveryReason? {
        guard let value: NSNumber = metadata?[.insulinDeliveryReason] else {
            return nil
        }
        return .init(rawValue: value.intValue)
    }

    public init(countsPerSecond: Double, reason: HKInsulinDeliveryReason, start: Date, end: Date, uuid: UUID? = nil, device: HKDevice? = nil, metadata: [String : Any]? = nil) {
        var metadata = metadata ?? [:]
        metadata[.insulinDeliveryReason] = NSNumber(value: reason.rawValue)
        self.init(value: countsPerSecond, start: start, end: end, uuid: uuid, device: device, metadata: metadata)
    }
}
