import Foundation
import HealthKit

public protocol HKCumulativeDistance: HKCumulativeQuantity {

}

extension HKCumulativeDistance {

    public static var defaultUnit: HKUnit { .meter() }

    /**
     Create a sample from a distance in meters.
     */
    public init(distance: Double, start: Date, end: Date, uuid: UUID? = nil, device: HKDevice? = nil, metadata: [String : Any]? = nil) {
        self.init(cumulativeQuantitySample: .init(
            type: Self.quantitySampleType,
            quantity: .init(unit: Self.defaultUnit, doubleValue: distance),
            start: start,
            end: end,
            device: device,
            metadata: metadata.adding(uuid: uuid)))
    }
}
