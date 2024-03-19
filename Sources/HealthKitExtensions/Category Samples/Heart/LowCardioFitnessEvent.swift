import Foundation
import HealthKit

/**
 An event that indicates the user’s VO2 max values consistently fall below a particular aerobic fitness threshold.

 In iOS 14.3 and later, users with a paired Apple Watch running watchOS 7.2 or later can enable a Health app experience that classifies their cardio fitness levels as either “Low”, “Below Average”, “Above Average”, or “High”, based on individual parameters and characteristics.

 Apple Watch can notify the user when their cardio fitness level falls into the Low category.
 If the user enables these notifications, they receive a notification when their VO2 max levels consistently fall below the low threshold for a period of time.
 The system sends low-cardio fitness notifications approximately once every four months.

 The system also creates a ``lowCardioFitnessEvent`` sample to record the event.
 The sample contains values from the ``HKCategoryValueLowCardioFitnessEvent`` enumeration.

 Samples of this type have two associated metadata keys:

 ``HKMetadataKeyVO2MaxValue``
    This key stores the value of the VO2 max sample that triggered the event.

 ``HKMetadataKeyLowCardioFitnessEventThreshold``
    This key stores the threshold value used to calculate the Low cardio classification.
    This value varies based on certain parameters and physical characteristics, such as the user’s age.

 Low-cardio fitness event samples are read-only.
 Use this identifier to request permission to read these samples; however, you can’t request authorization to share them, and you can’t save new low-cardio fitness event samples to the HealthKit store.
 */
public struct LowCardioFitnessEvent: HKCategoryEnumSample {
    
    public typealias Value = HKCategoryValueLowCardioFitnessEvent

    public static let categoryTypeIdentifier: HKCategoryTypeIdentifier = .lowCardioFitnessEvent

    public let categorySample: HKCategorySample

    public init(categorySample: HKCategorySample) {
        self.categorySample = categorySample
    }
}

extension LowCardioFitnessEvent {

    public static var mlPerKgMin: HKUnit {
        .literUnit(with: .milli).unitDivided(by: .minute()).unitDivided(by: .gramUnit(with: .kilo))
    }

    /// The maximum oxygen consumption rate during exercise of increasing intensity.
    ///
    /// The VO2 Max value (in `ml/(kg·min)`)
    public var vo2MaxValue: Double? {
        metadata?.vo2MaxValue?.doubleValue(for: Self.mlPerKgMin)
    }

    /// The threshold value used to calculate the Low cardio classification (in `ml/(kg·min)`).
    /// This value varies based on certain parameters and physical characteristics, such as the user’s age.
    ///
    ///  It contains the threshold value for the user’s VO2 max measurements.
    ///  The threshold value varies depending on certain parameters and physical characteristics, such as the user’s age.
    /// A low-cardio fitness event indicates a period of time when the user’s VO2 max measurements consistently fall below the defined value.
    /// The system triggers this event approximately once every four months.
    public var fitnessThreshold: Double? {
        metadata?.lowCardioFitnessEventThreshold?.doubleValue(for: Self.mlPerKgMin)
    }

    public init(value: HKCategoryValueLowCardioFitnessEvent, vo2MaxValue: Double, fitnessThreshold: Double, start: Date, end: Date, device: HKDevice? = nil, metadata: [String : Any]? = nil) {
        let unit = Self.mlPerKgMin
        var metadata = metadata ?? [:]
        metadata.vo2MaxValue = HKQuantity(unit: unit, doubleValue: vo2MaxValue)
        metadata.lowCardioFitnessEventThreshold = HKQuantity(unit: unit, doubleValue: fitnessThreshold)
        self.init(value: value, start: start, end: end, device: device, metadata: metadata)
    }
}
