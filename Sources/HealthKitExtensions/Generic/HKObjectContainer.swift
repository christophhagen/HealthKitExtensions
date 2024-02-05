import Foundation
import HealthKit

public protocol HKObjectContainer {

    var object: HKObject { get }

    init(object: HKObject)

    static var objectType: HKObjectType { get }
}

extension HKObjectContainer {

    public var uuid: UUID { object.uuid }

    public var device: HKDevice? { object.device }

    public var metadata: [String : Any]? { object.metadata }

    /// The external UUID, if it has been set
    public var externalUUID: UUID? {
        metadata?.externalUUID
    }

    /// The external UUID, if one was set, or the automatically assigned UUID
    public var preferredUUID: UUID {
        externalUUID ?? uuid
    }

    /// The metadata without the external UUID
    public var cleanMetadata: [String : Any] {
        metadata?.excluding(key: .externalUUID) ?? [:]
    }
}
