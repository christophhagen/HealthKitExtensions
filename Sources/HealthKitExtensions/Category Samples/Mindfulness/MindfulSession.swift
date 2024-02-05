import Foundation
import HealthKit

public struct MindfulSessionIdentifier: HKCategoryTypeIdentifierProvider {
    public static let identifier: HKCategoryTypeIdentifier = .mindfulSession
}

/**
 A category sample type for recording a mindful session.
 
 Use a ``HKCategoryValue.notApplicable`` value with these samples.
 */
public typealias MindfulSession = HKCategoryEmptySample<MindfulSessionIdentifier>
