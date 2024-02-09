import Foundation
import HealthKit

public struct HeartRateSpecification: HKQuantityTypeSpecification {

    public static let identifier: HKQuantityTypeIdentifier = .heartRate

    /// counts per second
    public static let defaultUnit: HKUnit = .count().unitDivided(by: .second())
}

/**
 A quantity sample type that measures the user’s heart rate.

 These samples use count/time units (described in ``HKUnit``) and measure discrete values (described in ``HKQuantityAggregationStyle``).

 Heart rate samples may include motion context information, which is stored as metadata using the ``HKMetadataKeyHeartRateMotionContext`` key.
 The value of this key is an ``NSNumber`` object that contains a ``HKHeartRateMotionContext`` value.

 The motion context gives additional information about the user’s activity level when the heart rate sample was taken.
 Apple Watch uses the following guidelines when setting the motion context:
 
 1. If the user has been still for at least 5 minutes prior to the sample, the context is set to the ``HKHeartRateMotionContext.sedentary`` value.
 2. If the user is in motion, the context is set to the ``HKHeartRateMotionContext.active`` value.

 You can add motion context to the metadata of any heart rate samples that you create.
 This means other apps may also save heart rate samples with (or without) the ``HKMetadataKeyHeartRateMotionContext`` metadata key.

 Note that not all heart rate samples have a motion context.
 For example, if Apple Watch cannot determine the motion context, it creates samples without a ``HKMetadataKeyHeartRateMotionContext`` metadata key.
 In addition, heart rate samples recorded by an Apple Watch (1st generation) or by a device running watchOS 3 or earlier do not have the motion context metadata key.
 Treat these samples as if they used the ``HKHeartRateMotionContext.notSet`` motion context.

 The default unit is counts per second.
 */
public typealias HeartRate = HKQuantityValue<HeartRateSpecification>

extension HeartRate {

    public init(countsPerSecond: Double, motionContext: HKHeartRateMotionContext, start: Date, end: Date, uuid: UUID? = nil, device: HKDevice? = nil, metadata: [String : Any]? = nil) {
        var metadata = metadata ?? [:]
        metadata[.heartRateMotionContext] = NSNumber(value: motionContext.rawValue)
        self.init(value: countsPerSecond, start: start, end: end, uuid: uuid, device: device, metadata: metadata)
    }

    /**
     The motion context of the heart rate sample.

     Heart rate samples may include motion context information, which is stored as metadata using the ``HKMetadataKeyHeartRateMotionContext`` key.
     The value of this key is an ``NSNumber`` object that contains a ``HKHeartRateMotionContext`` value.

     The motion context gives additional information about the user’s activity level when the heart rate sample was taken.
     Apple Watch uses the following guidelines when setting the motion context:

     1. If the user has been still for at least 5 minutes prior to the sample, the context is set to the ``HKHeartRateMotionContext.sedentary`` value.
     2. If the user is in motion, the context is set to the ``HKHeartRateMotionContext.active`` value.

     You can add motion context to the metadata of any heart rate samples that you create.
     This means other apps may also save heart rate samples with (or without) the ``HKMetadataKeyHeartRateMotionContext`` metadata key.

     Note that not all heart rate samples have a motion context.
     For example, if Apple Watch cannot determine the motion context, it creates samples without a ``HKMetadataKeyHeartRateMotionContext`` metadata key.
     In addition, heart rate samples recorded by an Apple Watch (1st generation) or by a device running watchOS 3 or earlier do not have the motion context metadata key.
     Treat these samples as if they used the ``HKHeartRateMotionContext.notSet`` motion context.
     */
    public var motionContext: HKHeartRateMotionContext {
        guard let number: NSNumber = metadata?[.heartRateMotionContext] else {
            return .notSet
        }
        return .init(rawValue: number.intValue) ?? .notSet
    }
}
