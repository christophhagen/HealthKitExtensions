import Foundation
import HealthKit

extension HKElectrocardiogram: HKSampleTypeContainer {

    public static let sampleType: HKSampleType = .electrocardiogramType()
}
