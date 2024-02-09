import Foundation
import HealthKit

@available(iOS 16.0, watchOS 9.0, *)
public struct AppleSleepingWristTemperatureSpecification: HKQuantityTypeSpecification {

    public static let identifier: HKQuantityTypeIdentifier = .appleSleepingWristTemperature

    public static let defaultUnit: HKUnit = .degreeCelsius()
}

/**
 Apple Watch Series 8 and Apple Watch Ultra can sample a person’s wrist temperature while they sleep. 
 A supported watch measures temperature from both sensors every five seconds overnight during sleep.
 The watch then aggregates this data to a single `appleSleepingWristTemperature` sample.
 It corrects this sample for environmental bias and calculates a single value that represents the wrist temperature over the entire night.
 
 Body temperature naturally fluctuates from night to night, and external factors, like the sleep environment, can also affect the measurements.
 Other factors that can affect a person’s relative temperature include exercise, jet lag, menstrual cycles, or illness.
 
 Cycle tracking uses a person’s sleeping wrist temperature data to provide a retrospective estimate of when they likely ovulated.
 It also combines this data with heart rate and logged cycle data to provide improved predictions about their cycle.
 
 To enable sleeping wrist temperature measurements, ensure Sleep Focus is on and that somone is wearing Apple Watch while sleeping.
 
 Apple Watch records the absolute wrist temperature value; however, Health displays this data as a relative value, based on a person’s baseline.
 Health needs to calculate this baseline, so it won’t display the wrist temperature until it has gathered about five nights of data.
 However, Apple Watch records `appleSleepingWristTemperature` samples starting with the first night, and you can read them immediately from the HealthKit store.

 Sleeping wrist temperature samples use temperature units (described in ``HKUnit``) and measure discrete values (described in ``HKQuantityAggregationStyle``).

 - Important: These samples are read-only.
 You can request permission to read the samples using this identifier, but you can’t request authorization to share them.
 This means you can’t save new sleeping wrist temperature samples to the HealthKit store.

 The default unit is degrees celsius.
 */
@available(iOS 16.0, watchOS 9.0, *)
public typealias AppleSleepingWristTemperature = HKQuantityValue<AppleSleepingWristTemperatureSpecification>
