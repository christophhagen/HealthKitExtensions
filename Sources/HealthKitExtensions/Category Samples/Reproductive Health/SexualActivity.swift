import Foundation
import HealthKit

/**
 A category sample type that records sexual activity.
 
 Use a ``HKCategoryValue.notApplicable`` value with these samples.
 These samples can include ``HKMetadataKeySexualActivityProtectionUsed`` metadata.
 */
public struct SexualActivity: HKCategoryEmptySample {

    public static let categoryTypeIdentifier: HKCategoryTypeIdentifier = .sexualActivity

    public let categorySample: HKCategorySample

    public init(categorySample: HKCategorySample) {
        self.categorySample = categorySample
    }

    /**
    Indicates if protection was used during sexual activity
     */
    public var protectionUsed: Bool? {
        metadata?.sexualActivityProtectionUsed
    }

    public init(protectionUsed: Bool, start: Date, end: Date, device: HKDevice? = nil, metadata: [String : Any]? = nil) {
        var metadata = metadata ?? [:]
        metadata.sexualActivityProtectionUsed = protectionUsed
        self.init(start: start, end: end, device: device, metadata: metadata)
    }
}
