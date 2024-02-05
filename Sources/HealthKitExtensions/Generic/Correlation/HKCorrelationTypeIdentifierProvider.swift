import Foundation
import HealthKit

public protocol HKCorrelationTypeIdentifierProvider {

    static var identifier: HKCorrelationTypeIdentifier { get }
}
