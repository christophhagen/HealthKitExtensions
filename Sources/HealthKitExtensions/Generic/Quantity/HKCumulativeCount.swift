import Foundation
import HealthKit

public protocol HKCumulativeCount: HKCumulativeQuantity {

}

extension HKCumulativeCount {
    
    public static var defaultUnit: HKUnit { .count() }

    /**
     Create a sample from a count.
     */
    public init(count: Double, start: Date, end: Date, uuid: UUID? = nil, device: HKDevice? = nil, metadata: [String : Any]? = nil) {
        self.init(cumulativeQuantitySample: .init(
            type: Self.quantitySampleType,
            quantity: .init(unit: Self.defaultUnit, doubleValue: count),
            start: start,
            end: end,
            device: device,
            metadata: metadata.adding(uuid: uuid)))
    }
}
