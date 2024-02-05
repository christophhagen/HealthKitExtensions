import Foundation
import HealthKit

public protocol HKCategoryTypeIdentifierProvider {

    static var identifier: HKCategoryTypeIdentifier { get }
}
