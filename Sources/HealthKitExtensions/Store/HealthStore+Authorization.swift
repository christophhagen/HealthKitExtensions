import Foundation
import HealthKit

extension HealthStore {

    /**
     Returns a Boolean value that indicates whether the current device supports clinical records.

     This method returns `true` if the device is set to a locale where clinical records are supported,
     or if the user already has clinical records downloaded to their HealthKit store.
     Otherwise, it returns `false`.
     
     This method lets users switch their locale without losing their health records.
     */
    public func supportsHealthRecords() -> Bool {
#if os(watchOS)
        return false
#else
        store.supportsHealthRecords()
#endif
    }

    /**
     Returns the app’s authorization status for sharing the specified data type.

     This method checks the authorization status for saving data.

     To help prevent possible leaks of sensitive health information, your app cannot determine whether or not a user has granted permission to read data.
     If you are not given permission, it simply appears as if there is no data of the requested type in the HealthKit store.
     If your app is given share permission but not read permission, you see only the data that your app has written to the store.
     Data from other sources remains hidden.

     - Parameter type: The type of data. This can be any concrete subclass of the ``HKObjectTypeContainer`` protocol.
     - Returns: A value indicating the app’s authorization status for this type. For a list of possible values, see ``HKAuthorizationStatus``.
     */
    public func authorizationStatus(for type: HKObjectTypeContainer.Type) -> HKAuthorizationStatus {
        store.authorizationStatus(for: type.objectType)
    }

    /**
     Asynchronously requests permission to save and read the specified data types.

     - Parameter typesToShare: A set containing the data types you want to share.
     This set can contain any concrete subclass of the ``HKSampleTypeContainer`` class.
     If the user grants permission, your app can create and save these data types to the HealthKit store.
     - Parameter typesToRead: A set containing the data types you want to read.
     This set can contain any concrete subclass of the ``HKObjectTypeContainer`` class.
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
    public func requestAuthorization(toShare typesToShare: [HKSampleTypeContainer.Type], read typesToRead: [HKObjectTypeContainer.Type]) async throws {
        let writableTypes = typesToShare.map { $0.sampleType }
        let readableTypes = typesToRead.map { $0.objectType }
        try await store.requestAuthorization(toShare: Set(writableTypes), read: Set(readableTypes))
    }

    /**
     Asynchronously requests permission to save and read the specified data types.

     - Parameter typesToShare: A list containing the data types you want to share.
     This set can contain any concrete subclass of the ``HKSampleTypeContainer`` class.
     If the user grants permission, your app can create and save these data types to the HealthKit store.
     - Parameter typesToRead: A list containing the data types you want to read.
     This set can contain any concrete subclass of the ``HKObjectTypeContainer`` class.
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
    public func requestAuthorization(toShare typesToShare: HKSampleTypeContainer.Type..., read typesToRead: HKObjectTypeContainer.Type...) async throws {
        try await requestAuthorization(toShare: typesToShare, read: typesToRead)
    }

    /**
     Indicates whether the system presents the user with a permission sheet if your app requests authorization for the provided types.

     When working with clinical types, users may need to reauthorize access when new data is added.
     */
    public func statusForAuthorizationRequest(toShare typesToShare: [HKSampleTypeContainer.Type], read typesToRead: [HKObjectTypeContainer.Type]) async throws -> HKAuthorizationRequestStatus {
        let writableTypes = typesToShare.map { $0.sampleType }
        let readableTypes = typesToRead.map { $0.objectType }
        return try await store.statusForAuthorizationRequest(toShare: Set(writableTypes), read: Set(readableTypes))
    }

    /**
     Asynchronously requests permission to read a data type that requires per-object authorization (such as vision prescriptions).

     Some samples require per-object authorization. 
     For these samples, people can select which ones your app can read on a sample-by-sample basis.
     By default, your app can read any of the per-object authorization samples that it has saved to the HealthKit store;
     however, you may not always have access to those samples.
     People can update the authorization status for any of these samples at any time.

     Your app can begin by querying for any samples that it already has permission to read.

     ```
     // Read the newest prescription from the HealthKit store.
     let queryDescriptor = HKSampleQueryDescriptor(
         predicates: [.visionPrescription()],
         sortDescriptors: [SortDescriptor(\.startDate, order: .reverse)],
         limit: 1)

     let prescription: HKVisionPrescription

     do {
         guard let result = try await queryDescriptor.result(for: store).first else {
             print("*** No prescription found. ***")
             return
         }
        prescription = result
     } catch {
         // Handle the error here.
         fatalError("*** An error occurred while reading the most recent vision prescriptions: \(error.localizedDescription) ***")
     }
     ```

     Based on the results, you can then decide whether you need to request authorization for additional samples. 
     Call `requestPerObjectReadAuthorization(for:predicate:)` to prompt someone to modify the samples your app has access to read.

     ```
     // Request authorization to read vision prescriptions.
     do {
        try await store.requestPerObjectReadAuthorization(for: .visionPrescriptionType(), predicate: nil)
     } catch HKError.errorUserCanceled {
         // Handle the user canceling the authorization request.
         print("*** The user canceled the authorization request. ***")
         return
     } catch {
         // Handle the error here.
         fatalError("*** An error occurred while requesting permission to read vision prescriptions: \(error.localizedDescription) ***")
     }
     ```
     - Important: Using the ``requestAuthorization(toShare:read:)`` method to request read access to any data types that require per-object authorization fails with an ``HKError.Code.errorInvalidArgument`` error.

     When your app calls this method, HealthKit displays an authorization sheet that asks for permission to read the samples that match the predicate and object type.
     The person using your app can then select individual samples to share with your app.
     The system always asks for permission, regardless of whether they previously granted it.

     After the person responds, the funcion returns.
     
     - Parameter objectType: The data type you want to read.
     - Parameter predicate: A predicate that further restricts the data type.
     */
    public func requestPerObjectReadAuthorization(for objectType: HKObjectTypeContainer.Type, predicate: NSPredicate?) async throws {
        if #available(iOS 16.0, *) {
            try await store.requestPerObjectReadAuthorization(for: objectType.objectType, predicate: predicate)
        } else {
            throw HKError(.errorHealthDataUnavailable)
        }
    }

    /**
     Requests permission to save and read the data types specified by an extension.

     The host app must implement the application delegate’s `applicationShouldRequestHealthAuthorization(_:)` method.
     This delegate method is called after an app extension calls `requestAuthorization(toShare:read:completion:)`.
     The host app is then responsible for calling `handleAuthorizationForExtension()`.
     This method prompts the user to authorize both the app and its extensions for the types that the extension requested.
     
     The system performs this request asynchronously.
     After the user has finished responding, this function returns.
     If the user has already chosen to grant or prohibit access to all of the types specified, the function returns without prompting the user.
     */
    public func handleAuthorizationForExtension() async throws {
#if os(watchOS)
        throw HKError(.errorHealthDataUnavailable)
#else
        try await store.handleAuthorizationForExtension()
#endif
    }

    /**
     Returns a Boolean value that indicates whether HealthKit is available on this device.

     By default, HealthKit data is available on iOS and watchOS. 
     HealthKit data is also available on iPadOS 17 or later. 
     However, devices running in an enterprise environment may restrict access to HealthKit data.

     Additionally, while the HealthKit framework is available on iPadOS 16 and earlier and on MacOS 13 and later, these devices don’t have a copy of the HealthKit store. 
     This means you can include HealthKit code in apps running on these devices, simplifying the creation of multiplatform apps.
     However, they can’t read or write HealthKit data, and calls to ``isHealthDataAvailable()`` return ``false``.

     - Returns: `true` if HealthKit is available; otherwise, `false`.
     */
    static func isHealthDataAvailable() -> Bool {
        HKHealthStore.isHealthDataAvailable()
    }

}
