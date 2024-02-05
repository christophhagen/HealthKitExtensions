import Foundation
import HealthKit

extension HKCategoryValueMenstrualFlow: HKCategoryTypeIdentifierProvider {
    public static let identifier: HKCategoryTypeIdentifier = .menstrualFlow
}

/**
 A category sample type that records menstrual cycles.
 
 These samples use values from the ``HKCategoryValueMenstrualFlow`` enum.
 Additionally, these samples must include ``HKMetadataKeyMenstrualCycleStart`` metadata.

 When recording data about the user’s menstrual cycle, you can either use a single sample for the entire period, or multiple samples to record changes over the cycle. 
 When using single samples, pass the start of the menstrual period to the startDate parameter.
 Pass the end of the period to the endDate parameter, and set the ``HKMetadataKeyMenstrualCycleStart`` value to true.

 When using multiple samples to record a single period, the startDate and endDate parameters should mark the beginning and ending of each individual sample. 
 Set the ``HKMetadataKeyMenstrualCycleStart`` value for the first sample in the period to true.
 Use false for any additional samples. 
 Different samples can use different menstrualFlow values to record the changes in flow over time.
 */
public typealias MenstrualFlow = HKCategoryEnumSample<HKCategoryValueMenstrualFlow>

extension MenstrualFlow {

    /// Indicates whether the sample represents the start of a menstrual cycle.
    public var cycleStart: Bool? {
        metadata?[.menstrualCycleStart]
    }

    /**
     Create a new Menstrual Flow sample.
     */
    public init(value: HKCategoryValueMenstrualFlow, cycleStart: Bool, start: Date, end: Date, device: HKDevice? = nil, metadata: [String : Any]? = nil) {
        var metadata = metadata ?? [:]
        metadata[.menstrualCycleStart] = cycleStart
        self.init(value: value, start: start, end: end, device: device, metadata: metadata)
    }
}
