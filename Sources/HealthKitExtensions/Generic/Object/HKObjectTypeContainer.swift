import Foundation
import HealthKit

public protocol HKObjectTypeContainer {

    static var objectType: HKObjectType { get }
}

extension HKObjectTypeContainer {

    public var objectType: HKObjectType { Self.objectType }
}

