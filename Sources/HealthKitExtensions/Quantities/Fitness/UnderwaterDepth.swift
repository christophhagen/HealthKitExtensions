import Foundation
import HealthKit

/**
 A quantity sample that records a person’s depth underwater.

 Apple Watch Ultra automatically records these samples during dive sessions.
 
 Underwater depth samples use length units (described in ``HKUnit``) and measure cumulative values (described in ``HKQuantityAggregationStyle``).

 The default unit is meter.
 */
@available(iOS 16.0, watchOS 9.0, *)
public struct UnderwaterDepth: HKCumulativeQuantity {

    public static let quantityTypeIdentifier: HKQuantityTypeIdentifier = .underwaterDepth

    public static var defaultUnit: HKUnit = .meter()

    public let cumulativeQuantitySample: HKCumulativeQuantitySample

    public init(cumulativeQuantitySample: HKCumulativeQuantitySample) {
        self.cumulativeQuantitySample = cumulativeQuantitySample
    }
}
