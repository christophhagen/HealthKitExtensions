import Foundation
import HealthKit

public struct NumberOfTimesFallenSpecification: HKQuantityTypeSpecification {

    public static let identifier: HKQuantityTypeIdentifier = .numberOfTimesFallen

    /// count
    public static let defaultUnit: HKUnit = .count()
}

/**
 A quantity sample type that measures the number of times the user fell.

 These samples use count units (described in ``HKUnit``) and measure cumulative values (described in ``HKQuantityAggregationStyle``).

 **Detect and Respond to Falls**

 There are two approaches to detecting falls in your app. 
 You can either query for ``numberOfTimesFallen`` samples in HealthKit, or you can use Core Motion’s ``CMFallDetectionManager``.

 The Core Motion fall detection manager is particularly useful for apps that need to respond to falls in a timely manner so that the app can provide help to the person who fell.
 
 The fall detection manager:
 - Notifies the app in real time
 - Notifies the app of all fall events
 - Provides background runtime so that your app can respond to the fall

 **Detect and Monitor Falls Over Time**

 The HealthKit sample is particularly useful for apps that monitor falls over longer time periods, because there can be a delay between the fall event and HealthKit updating its samples.
 
 HealthKit provides:
 - Samples that are available on all devices that can access the person’s HealthKit data—not just the device that detected the fall
 - Samples for falls where the person who fell confirmed the fall, or the system escalated the fall to emergency services. If the person who fell dismisses the fall alert, HealthKit doesn’t record the fall.

 Both Core Motion and HealthKit need to authorize access to fall detection before they receive any notifications; however, Core Motion requires an additional entitlement from Apple.
 To apply for the entitlement, see [Fall Detection Entitlement Request](https://developer.apple.com/contact/request/fall-detection-api).

 The default unit is counts.
 */
public typealias NumberOfTimesFallen = HKCumulativeQuantityValue<NumberOfTimesFallenSpecification>
