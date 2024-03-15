import Foundation
import HealthKit

extension HealthStore {

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

}
