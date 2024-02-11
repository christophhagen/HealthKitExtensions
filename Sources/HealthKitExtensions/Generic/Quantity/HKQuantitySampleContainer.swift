import Foundation
import HealthKit

public protocol HKQuantitySampleContainer: HKSampleContainer {

    var quantitySample: HKQuantitySample { get }

    init(quantitySample: HKQuantitySample)

    static var quantitySampleType: HKQuantityType { get }
}

extension HKQuantitySampleContainer {

    public var sample: HKSample { quantitySample }

    public init(sample: HKSample) {
        self.init(quantitySample: sample as! HKQuantitySample)
    }

    public static var sampleType: HKSampleType { quantitySampleType }

    /**
     The quantity for this sample.
     
     If the sample contains more than one quantity, this property returns the sum or average, depending on the sample’s aggregation style (sum for cumulative, average for discrete).
     To access the individual quantities, use an ``HKQuantitySeriesSampleQuery``.
     To see the type of units compatible with this quantity, look up the sample’s quantity type identifier in ``HKQuantityTypeIdentifier``.
     */
    public var quantity: HKQuantity { quantitySample.quantity }

    /**
     The number of quantities contained in this sample.
     
     Samples created using one of the `init()` methods have a count of `1`.
     Samples created using an ``HKQuantitySeriesSampleBuilder`` may have a count greater than `1`.
     */
    public var count: Int { quantitySample.count }

    public var quantitySampleType: HKQuantityType { Self.quantitySampleType }

    /// The aggregation style for the quantity
    public var aggregationStyle: HKQuantityAggregationStyle { quantitySampleType.aggregationStyle }

    /// The aggregation style for the quantity
    public static var aggregationStyle: HKQuantityAggregationStyle { quantitySampleType.aggregationStyle }
}
