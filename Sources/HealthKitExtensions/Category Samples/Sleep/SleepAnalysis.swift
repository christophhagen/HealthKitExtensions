import Foundation
import HealthKit

extension HKCategoryValueSleepAnalysis: HKCategoryTypeIdentifierProvider {
    public static let identifier: HKCategoryTypeIdentifier = .sleepAnalysis
}

/**
 A category sample type for sleep analysis information.

 These samples use values from the ``HKCategoryValueSleepAnalysis`` enum.
 For best results when analyzing sleep samples, it's recommended that you use ``HKMetadataKeyTimeZone`` to store time zone metadata with your sleep sample data.
 */
public typealias SleepAnalysis = HKCategoryEnumSample<HKCategoryValueSleepAnalysis>

extension SleepAnalysis {

    public var timeZone: TimeZone? {
        guard let timeZoneString: String = metadata?[.timeZone] else {
            return nil
        }
        return TimeZone(identifier: timeZoneString)
    }

    public init(value: HKCategoryValueSleepAnalysis, timeZone: TimeZone, start: Date, end: Date, device: HKDevice? = nil, metadata: [String : Any]? = nil) {
        var metadata = metadata ?? [:]
        metadata[.timeZone] = timeZone.identifier
        self.init(value: value, start: start, end: end, device: device, metadata: metadata)
    }
}
