import Foundation
import HealthKit

/**
 A quantity sample type that measures the number of standard alcoholic drinks that the user has consumed.

 Samples matching the ``numberOfAlcoholicBeverages`` identifier measure the number of standard alcoholic drinks consumed by the user.
 A standard drink is one beer, glass of wine, or mixed drink made with spirits.
 The samples use count units (described in ``HKUnit``) to measure cumulative values (described in ``HKQuantityAggregationStyle``).

 The following code listing saves a single standard drink to the HealthKit store.
 ```
 // Create the alcoholic beverage sample type.
 let alcoholConsumptionType = HKQuantityType(.numberOfAlcoholicBeverages)


 // Create a quantity for the number of standard beverages consumed.
 let beverageCount = HKQuantity(unit:HKUnit.count(), doubleValue:1.0)


 // Get the current date.
 let date = Date()


 // Create the alcoholic beverage consumption sample.
 let beverageSample = HKQuantitySample(type: alcoholConsumptionType,
                                       quantity: beverageCount,
                                       start: date,
                                       end: date)


 // Save the sample to the HealthKit store.
 store.save(beverageSample) { (success, error) in

     if success {
         // The system successfully saved the sample.

     } else {
         if let error = error {
             // Handle the error here.
         }
     }
 }
 ```
 The default unit is counts.
 */
public struct NumberOfAlcoholicBeverages: HKCumulativeCount {

    public static let quantityTypeIdentifier: HKQuantityTypeIdentifier = .numberOfAlcoholicBeverages

    public let cumulativeQuantitySample: HKCumulativeQuantitySample

    public init(cumulativeQuantitySample: HKCumulativeQuantitySample) {
        self.cumulativeQuantitySample = cumulativeQuantitySample
    }
}
