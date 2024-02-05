import Foundation
import HealthKit

public protocol HKQuantityTypeSpecification {

    static var identifier: HKQuantityTypeIdentifier { get }

    static var defaultUnit: HKUnit { get }
}
