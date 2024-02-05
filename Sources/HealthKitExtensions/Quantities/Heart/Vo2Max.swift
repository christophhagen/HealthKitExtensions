import Foundation
import HealthKit

public struct Vo2MaxSpecification: HKQuantityTypeSpecification {

    public static let identifier: HKQuantityTypeIdentifier = .vo2Max

    /// `ml/(kg*min)`
    public static let defaultUnit: HKUnit = 
        .literUnit(with: .milli)
        .unitDivided(by: .minute())
        .unitDivided(by: .gramUnit(with: .kilo))
}

/**
 A quantity sample that measures the maximal oxygen consumption during exercise.

 VO2max—the maximum amount of oxygen your body can consume during exercise— is a strong predictor of overall health. 
 Clinical tests measure VO2max by having the patient exercise on a treadmill or bike, with an intensity that increases every few minutes until exhaustion.
 
 On Apple Watch Series 3 or later, the system automatically saves ``vo2Max`` samples to HealthKit.
 The watch estimates the user’s VO2max based on data gathered while the user is walking or running outdoors.
 For more information, see [Understand Estimated Test Results](https://developer.apple.com/documentation/healthkit/hkquantitytypeidentifier/3552083-sixminutewalktestdistance#3683764).

 You can also create and save your own ``vo2Max`` samples—for example, when creating an app that records the results of tests performed in a clinic.
 When creating vo2Max samples, use the ``HKMetadataKeyVO2MaxTestType`` metadata key to specify the type of test used to generate the sample.
 vo2Max samples use volume/mass/time units (described in ``HKUnit``), measured in ml/kg /min.
 They measure discrete values (described in ``HKQuantityAggregationStyle``).

 **Understand Estimated Test Results**

 Apple Watch Series 3 and later estimates the user’s VO2max by measuring the user’s heart rate response to exercise.
 The system can generate VO2max samples after an outdoor walk, outdoor run, or hiking workout.
 During the outdoor activity, the user must cover relatively flat ground (a grade of less than 5% incline or decline) with adequate GPS, heart rate signal quality, and sufficient exertion.
 The user must maintain a heart rate approximately greater than or equal to 130% of their resting heart rate.
 The system can estimate VO2max ranges from 14-60 ml/kg/min
 
 The user must wear their Apple Watch for at least one day before the system can generate the first vo2Max sample.
 Additionally, the system doesn’t generate a vo2Max sample on the user’s first workout.
 However, it can make estimates based on data collected outside a workout session.
 
 Apple Watch estimates `VO2max` based on sub-maximal predictions rather than `peakVO2`.
 Users don’t need to achieve peak heart rate to receive an estimate; however, the system does need to estimate their peak heart rate.
 Users who take medications that may reduce their peak heart rate can toggle a medication switch in the Health app to enable more accurate VO2max estimates.

 The default unit is `ml/(kg*min)`
 */
public typealias Vo2Max = HKQuantityValue<Vo2MaxSpecification>

extension Vo2Max {

    /**
     The method used to calculate the user’s VO2 max rate.
     */
    public var testType: HKVO2MaxTestType? {
        guard let number: NSNumber = metadata?[.vO2MaxTestType] else {
            return nil
        }
        return .init(rawValue: number.intValue)
    }

    /**
     - Parameter value: The vo2max value, in `ml/(kg*min)
     - Parameter testType: The method used to calculate the user’s VO2 max rate.
     */
    public init(value: Double, testType: HKVO2MaxTestType, start: Date, end: Date, device: HKDevice? = nil, metadata: [String : Any]? = nil) {
        var metadata = metadata ?? [:]
        metadata[.vO2MaxTestType] = NSNumber(value: testType.rawValue)
        self.init(value: value, start: start, end: end, device: device, metadata: metadata)
    }

    /**
     - Parameter value: The vo2max value, in `ml/(kg*min)
     - Parameter testType: The method used to calculate the user’s VO2 max rate.
     */
    public init(value: Double, testType: HKVO2MaxTestType, start: Date, end: Date, uuid: UUID, device: HKDevice? = nil, metadata: [String : Any]? = nil) {
        var metadata = metadata ?? [:]
        metadata[.vO2MaxTestType] = NSNumber(value: testType.rawValue)
        self.init(value: value, start: start, end: end, uuid: uuid, device: device, metadata: metadata)
    }
}
