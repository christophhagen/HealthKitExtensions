import Foundation
import HealthKit

public protocol HKDiscreteQuantitySampleContainer: HKQuantitySampleContainer {

    var discreteQuantitySample: HKDiscreteQuantitySample { get }

    init(discreteQuantitySample: HKDiscreteQuantitySample)

}

extension HKDiscreteQuantitySampleContainer {

    public var quantitySample: HKQuantitySample { discreteQuantitySample }

    public init(quantitySample: HKQuantitySample) {
        self.init(discreteQuantitySample: quantitySample as! HKDiscreteQuantitySample)
    }

    /// The average of all quantities contained by the sample.
    public var averageQuantity: HKQuantity { discreteQuantitySample.averageQuantity }

    /// The maximum quantity contained by the sample.
    public var maximumQuantity: HKQuantity { discreteQuantitySample.maximumQuantity }

    /// The minimum value contained by the sample.
    public var minimumQuantity: HKQuantity { discreteQuantitySample.minimumQuantity }

    /// The most recent quantity contained by the sample.
    public var mostRecentQuantity: HKQuantity { discreteQuantitySample.mostRecentQuantity }

    /// The date interval for the most recent quantity contained by the sample.
    public var mostRecentQuantityDateInterval: DateInterval { discreteQuantitySample.mostRecentQuantityDateInterval }

}
