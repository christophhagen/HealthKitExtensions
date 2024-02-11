import Foundation
import HealthKit

public struct PeripheralPerfusionIndexSpecification: HKQuantityTypeSpecification {

    public static let identifier: HKQuantityTypeIdentifier = .peripheralPerfusionIndex

    /// percent
    public static let defaultUnit: HKUnit = .percent()
}

/**
 A quantity sample type that measures the user’s peripheral perfusion index.
 
 The peripheral perfusion index measures the pulse strength at the monitoring site.
 These samples use percent units (described in ``HKUnit``) and measure discrete values (described in ``HKQuantityAggregationStyle``).

 The default unit is percent.
 */
public typealias PeripheralPerfusionIndex = HKDiscreteQuantityValue<PeripheralPerfusionIndexSpecification>
