import Foundation
import HealthKit

@available(iOS 13.6, *)
public struct RapidPoundingOrFlutteringHeartbeatIdentifier: HKCategoryTypeIdentifierProvider {
    public static let identifier: HKCategoryTypeIdentifier = .rapidPoundingOrFlutteringHeartbeat
}

/**
 A category type that records a rapid, pounding, or fluttering heartbeat as a symptom.

 These samples use values from the ``HKCategoryValueSeverity`` enumeration.
 */
@available(iOS 13.6, *)
public typealias RapidPoundingOrFlutteringHeartbeat = HKCategoryValueSeveritySample<RapidPoundingOrFlutteringHeartbeatIdentifier>
