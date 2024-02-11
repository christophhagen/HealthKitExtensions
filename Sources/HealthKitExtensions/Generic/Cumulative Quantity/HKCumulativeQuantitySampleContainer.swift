import Foundation
import HealthKit

public protocol HKCumulativeQuantitySampleContainer: HKQuantitySampleContainer {

    var cumulativeQuantitySample: HKCumulativeQuantitySample { get }

    init(cumulativeQuantitySample: HKCumulativeQuantitySample)

}

extension HKCumulativeQuantitySampleContainer {

    public var quantitySample: HKQuantitySample { cumulativeQuantitySample }

    public init(quantitySample: HKQuantitySample) {
        self.init(cumulativeQuantitySample: quantitySample as! HKCumulativeQuantitySample)
    }

    /// The sum of all the quantities contained by the sample.
    public var sumQuantity: HKQuantity { cumulativeQuantitySample.sumQuantity }
}
