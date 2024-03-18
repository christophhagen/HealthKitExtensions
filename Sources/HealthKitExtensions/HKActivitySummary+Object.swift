import Foundation
import HealthKit

extension HKActivitySummary: HKObjectTypeContainer {

    public static let objectType: HKObjectType = .activitySummaryType()
}
