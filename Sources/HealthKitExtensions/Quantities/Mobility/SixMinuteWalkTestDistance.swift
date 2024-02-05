import Foundation
import HealthKit

public struct SixMinuteWalkTestDistanceSpecification: HKQuantityTypeSpecification {

    public static let identifier: HKQuantityTypeIdentifier = .sixMinuteWalkTestDistance

    /// meter
    public static let defaultUnit: HKUnit = .meter()
}

/**
 A quantity sample type that stores the distance a user can walk during a six-minute walk test.

 The standard six-minute walk test measures the maximum number of meters a user can walk on an unobstructed, flat course.
 
 On Apple Watch Series 3 or later, the system automatically records a weekly ``sixMinuteWalkTestDistance`` sample.
 You can also create and save your own ``sixMinuteWalkTestDistance`` samples—for example, when creating an app that records the results of tests performed in a clinic.

 ``sixMinuteWalkTestDistance`` samples use length units (described in ``HKUnit``) and measure discrete values (described in ``HKQuantityAggregationStyle``).
 For example, the following code creates a unit in meters.
 ```
 let meters = HKUnit.meter()
 ```

 **Understand Estimated Test Results**
 
 Each week, the system calculates the approximate result a user might receive from a six-minute walk test administered at a clinic.
 The system estimates the result using passively observed motion and workout data.
 The maximum estimated distance is 500m.
 
 To record an estimate, the user must wear the watch at least 8 hours a day, 3 days a week.
 Additionally, the user must meet the 8-hour threshold at least 10 times over the previous 4 weeks.
 
 Apple Watch produces the best results when the user’s expected six-minute walk distance is less than 500m, and the user wears a calibrated Apple Watch while performing a representative range of physical activities each day.
 For more information about calibrating Apple Watch, see [Calibrating your Apple Watch for improved Workout and Activity accuracy](https://support.apple.com/en-us/HT204516).

 If the watch isn’t calibrated, users can improve the accuracy of their results by carrying their iPhone on their hip or in their front pants pocket.
 The system uses the ``walkingSpeed`` samples automatically recorded by the phone to help calibrate the six-minute walk algorithm.
 The system may also use GPS from both iPhone and Apple Watch to improve the calibration.
 
 Samples indicate whether the device was sufficiently calibrated to support an accurate estimate using the ``HKMetadataKeyAppleDeviceCalibrated`` metadata key.

 The default unit is meter.
 */
public typealias SixMinuteWalkTestDistance = HKQuantityValue<SixMinuteWalkTestDistanceSpecification>

extension SixMinuteWalkTestDistance {

    /**
     Indicating whether the system had data from a sufficient amount of calibrated sensors when recording the sample.

     This key takes a Boolean value. 
     If it’s true, the system has enough high-quality data to make an accurate estimate.
     If it’s false, the system provides an estimate based on data that may be less accurate.
     
     The key is read-only.
     */
    public var appleDeviceCalibrated: Bool? {
        metadata?[.appleDeviceCalibrated]
    }

}
