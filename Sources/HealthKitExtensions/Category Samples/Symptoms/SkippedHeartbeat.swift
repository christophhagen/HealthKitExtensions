import Foundation
import HealthKit

@available(iOS 13.6, *)
public struct SkippedHeartbeatIdentifier: HKCategoryTypeIdentifierProvider {
    public static let identifier: HKCategoryTypeIdentifier = .skippedHeartbeat
}

/**
 A category type that records skipped heartbeat as a symptom.

 These samples use values from the ``HKCategoryValueSeverity`` enumeration.
 */
@available(iOS 13.6, *)
public typealias SkippedHeartbeat = HKCategoryValueSeveritySample<SkippedHeartbeatIdentifier>
