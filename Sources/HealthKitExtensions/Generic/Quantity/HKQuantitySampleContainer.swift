import Foundation
import HealthKit

public protocol HKQuantitySampleContainer: HKSampleContainer {

    static var quantityTypeIdentifier: HKQuantityTypeIdentifier { get }

    static var defaultUnit: HKUnit { get }

    var quantitySample: HKQuantitySample { get }

    init(quantitySample: HKQuantitySample)
}

extension HKQuantitySampleContainer {

    public static var quantitySampleType: HKQuantityType { .init(quantityTypeIdentifier) }

    public var quantitySampleType: HKQuantityType { Self.quantitySampleType }


    /// The unit used for the sample by default
    public var defaultUnit: HKUnit { Self.defaultUnit }

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
     The value in the default unit

     To access the default unit, use ``defaultUnit``.
     To access the quanity directly, use ``quantity``.
     */
    public var value: Double {
        quantity.doubleValue(for: Self.defaultUnit)
    }

    /**
     The number of quantities contained in this sample.
     
     Samples created using one of the `init()` methods have a count of `1`.
     Samples created using an ``HKQuantitySeriesSampleBuilder`` may have a count greater than `1`.
     */
    public var count: Int { quantitySample.count }

    /// The aggregation style for the quantity
    public var aggregationStyle: HKQuantityAggregationStyle { quantitySampleType.aggregationStyle }

    /// The aggregation style for the quantity
    public static var aggregationStyle: HKQuantityAggregationStyle { quantitySampleType.aggregationStyle }
}
