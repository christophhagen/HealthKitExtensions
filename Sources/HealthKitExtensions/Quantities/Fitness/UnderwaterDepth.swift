import Foundation
import HealthKit

@available(iOS 16.0, watchOS 9.0, *)
public struct UnderwaterDepthSpecification: HKQuantityTypeSpecification {

    public static let identifier: HKQuantityTypeIdentifier = .underwaterDepth

    /// meter
    public static let defaultUnit: HKUnit = .meter()
}

/**
 A quantity sample that records a person’s depth underwater.

 Apple Watch Ultra automatically records these samples during dive sessions.
 
 Underwater depth samples use length units (described in ``HKUnit``) and measure cumulative values (described in ``HKQuantityAggregationStyle``).

 The default unit is meter.
 */
@available(iOS 16.0, watchOS 9.0, *)
public typealias UnderwaterDepth = HKQuantityValue<UnderwaterDepthSpecification>
