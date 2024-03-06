import Foundation
import HealthKit

/**
 A quantity sample type that measures electrodermal activity.

 Electrodermal activity measures the conductance of the user’s skin.
 This conductance increases as the activity of the sweat glands increases.
 These samples use conductance units (described in ``HKUnit``) and measure discrete values (described in ``HKQuantityAggregationStyle``).

 The default unit is microsiemens.
 */
public struct ElectrodermalActivity: HKDiscreteQuantity {

    public static let quantityTypeIdentifier: HKQuantityTypeIdentifier = .electrodermalActivity

    /// microsiemens
    public static let defaultUnit: HKUnit = .siemenUnit(with: .micro)

    public let discreteQuantitySample: HKDiscreteQuantitySample

    public init(discreteQuantitySample: HKDiscreteQuantitySample) {
        self.discreteQuantitySample = discreteQuantitySample
    }
}
