import Foundation
import HealthKit

extension HKHealthStore {

    /**
     Saves the provided object to the HealthKit store.

     - Parameter object: The HealthKit object to be saved. This object can be any concrete type conforming to the ``HKObjectContainer`` protocol.

     If your app has not requested permission to share the object’s data type, the method fails with an ``HKError.Code.errorAuthorizationNotDetermined`` error.
     If your app has been denied permission to save the object’s data type, it fails with an ``HKError.Code.errorAuthorizationDenied`` error.
     Saving an object with the same unique identifier as an object already in the HealthKit store fails with an ``HKError.Code.errorInvalidArgument`` error.
     When saving multiple objects, if any object cannot be saved, none of them are saved.

     In iOS 9.0 and later, saving an object to the HealthKit store sets the object’s ``sourceRevision`` property to a ``HKSourceRevision`` instance representing the saving app.
     On earlier versions of iOS, saving an object sets the ``source`` property to a ``HKSource`` instance instead.
     In both cases, these values are available only after the object is retrieved from the HealthKit store.
     The original object is not changed.

     All samples retrieved by iOS 9.0 and later are given a valid ``sourceRevision`` property.
     If the sample was saved using an earlier version of iOS, the source revision’s version is set to `nil`.
     */
    @available(iOS 13.0.0, *)
    public func save(_ sample: HKSampleContainer) async throws {
        try await save(sample.sample)
    }

    /**
     Saves an array of objects to the HealthKit store.

     - Parameter objects: An array containing concrete type conforming to the ``HKObjectContainer`` protocol.

     If your app has not requested permission to share the object’s data type, the method fails with an ``HKError.Code.errorAuthorizationNotDetermined`` error.
     If your app has been denied permission to save the object’s data type, it fails with an ``HKError.Code.errorAuthorizationDenied`` error.
     Saving an object with the same unique identifier as an object already in the HealthKit store fails with an ``HKError.Code.errorInvalidArgument`` error.
     When saving multiple objects, if any object cannot be saved, none of them are saved.
     
     In iOS 9.0 and later, saving an object to the HealthKit store sets the object’s ``sourceRevision`` property to a ``HKSourceRevision`` instance representing the saving app.
     On earlier versions of iOS, saving an object sets the ``source`` property to a ``HKSource`` instance instead.
     In both cases, these values are available only after the object is retrieved from the HealthKit store.
     The original object is not changed.
     
     All samples retrieved by iOS 9.0 and later are given a valid ``sourceRevision`` property.
     If the sample was saved using an earlier version of iOS, the source revision’s version is set to `nil`.
     */
    public func save(_ samples: [HKSampleContainer]) async throws {
        try await save(samples.map { $0.sample })
    }

    /**
     Asynchronously requests permission to save and read the specified data types.

     - Parameter typesToShare: A set containing the data types you want to share. 
     This set can contain any concrete subclass of the ``HKSampleContainer`` class.
     If the user grants permission, your app can create and save these data types to the HealthKit store.
     - Parameter typesToRead: A set containing the data types you want to read. 
     This set can contain any concrete subclass of the ``HKObjectContainer`` class.
     If the user grants permission, your app can read these data types from the HealthKit store.

     HealthKit performs these requests asynchronously. 
     If you call this method with a new data type (a type of data that the user hasn’t previously granted or denied permission for in this app), the system automatically displays the permission form, listing all the requested permissions.
     After the user has finished responding, this method calls its completion block on a background queue.
     If the user has already chosen to grant or prohibit access to all of the types specified, HealthKit calls the completion without prompting the user.
     
     - Important: In watchOS 6 and later, this method displays the permission form on Apple Watch, enabling independent HealthKit apps.
     In watchOS 5 and earlier, this method prompts the user to authorize the app on their paired iPhone.
     For more information, see Creating Independent watchOS Apps.
     
     Each data type has two separate permissions, one to read it and one to share it. 
     You can make a single request, and include all the data types your app needs.
     Customize the messages displayed on the permissions sheet by setting the following keys:
     
     - ``NSHealthShareUsageDescription`` customizes the message for reading data.
     - ``NSHealthUpdateUsageDescription`` customizes the message for writing data.

     - Warning: You must set the usage keys, or your app will crash when you request authorization.

     For projects created using Xcode 13 or later, set these keys in the Target Properties list on the app’s Info tab.
     For projects created with Xcode 12 or earlier, set these keys in the apps Info.plist file.
     For more information, see Information Property List.
     
     After users have set the permissions for your app, they can always change them using either the Settings or the Health app.
     Your app appears in the Health app’s Sources tab, even if the user didn’t allow permission to read or share data.
     */
    public func requestAuthorization(toShare typesToShare: [HKSampleContainer.Type], read typesToRead: [HKObjectContainer.Type]) async throws {
        let writableTypes = typesToShare.map { $0.sampleType }
        let readableTypes = typesToRead.map { $0.objectType }
        try await requestAuthorization(toShare: Set(writableTypes), read: Set(readableTypes))
    }

    /**
     Asynchronously requests permission to save and read the specified data types.

     - Parameter typesToShare: A list containing the data types you want to share.
     This set can contain any concrete subclass of the ``HKSampleContainer`` class.
     If the user grants permission, your app can create and save these data types to the HealthKit store.
     - Parameter typesToRead: A list containing the data types you want to read.
     This set can contain any concrete subclass of the ``HKObjectContainer`` class.
     If the user grants permission, your app can read these data types from the HealthKit store.

     HealthKit performs these requests asynchronously.
     If you call this method with a new data type (a type of data that the user hasn’t previously granted or denied permission for in this app), the system automatically displays the permission form, listing all the requested permissions.
     After the user has finished responding, this method calls its completion block on a background queue.
     If the user has already chosen to grant or prohibit access to all of the types specified, HealthKit calls the completion without prompting the user.

     - Important: In watchOS 6 and later, this method displays the permission form on Apple Watch, enabling independent HealthKit apps.
     In watchOS 5 and earlier, this method prompts the user to authorize the app on their paired iPhone.
     For more information, see Creating Independent watchOS Apps.

     Each data type has two separate permissions, one to read it and one to share it.
     You can make a single request, and include all the data types your app needs.
     Customize the messages displayed on the permissions sheet by setting the following keys:

     - ``NSHealthShareUsageDescription`` customizes the message for reading data.
     - ``NSHealthUpdateUsageDescription`` customizes the message for writing data.

     - Warning: You must set the usage keys, or your app will crash when you request authorization.

     For projects created using Xcode 13 or later, set these keys in the Target Properties list on the app’s Info tab.
     For projects created with Xcode 12 or earlier, set these keys in the apps Info.plist file.
     For more information, see Information Property List.

     After users have set the permissions for your app, they can always change them using either the Settings or the Health app.
     Your app appears in the Health app’s Sources tab, even if the user didn’t allow permission to read or share data.
     */
    public func requestAuthorization(toShare typesToShare: HKSampleContainer.Type..., read typesToRead: HKObjectContainer.Type...) async throws {
        try await requestAuthorization(toShare: typesToShare, read: typesToRead)
    }

    public func read<T>(predicate: NSPredicate? = nil, sortDescriptors: [SortDescriptor<HKQuantitySample>], limit: Int? = nil) async throws -> [T] where T: HKQuantitySampleContainer {

        let descriptor = HKSampleQueryDescriptor(
            predicates: [.quantitySample(type: T.quantitySampleType, predicate: predicate)],
            sortDescriptors: sortDescriptors,
            limit: limit)

        let results = try await descriptor.result(for: self)
        return results.map { T.init(sample: $0) }
    }

    public func read<T>(predicate: NSPredicate? = nil, sortDescriptors: [SortDescriptor<HKCorrelation>], limit: Int? = nil) async throws -> [T] where T: HKCorrelationContainer {

        let descriptor = HKSampleQueryDescriptor(
            predicates: [.correlation(type: T.correlationType, predicate: predicate)],
            sortDescriptors: sortDescriptors,
            limit: limit)

        let results = try await descriptor.result(for: self)
        return results.map { T.init(sample: $0) }
    }

    public func read<T>(predicate: NSPredicate? = nil, sortDescriptors: [SortDescriptor<HKCategorySample>], limit: Int? = nil) async throws -> [T] where T: HKCategorySampleContainer {

        let descriptor = HKSampleQueryDescriptor(
            predicates: [.categorySample(type: T.categorySampleType, predicate: predicate)],
            sortDescriptors: sortDescriptors,
            limit: limit)

        let results = try await descriptor.result(for: self)
        return results.map { T.init(sample: $0) }
    }
}
