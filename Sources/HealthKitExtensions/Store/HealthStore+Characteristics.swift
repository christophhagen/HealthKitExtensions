import Foundation
import HealthKit

extension HealthStore {

    // MARK: - Reading characteristic data

    /**
     Reads the user’s date of birth from the HealthKit store as date components.

     If the user has not yet specified a birth date, or if the user has denied your app permission to read the birth date, this method returns an empty ``DateComponents`` object.

     - Returns: A ``DateComponents`` object representing the user’s birthdate in the Gregorian calendar.
     */
    public func dateOfBirthComponents() throws -> DateComponents {
        try store.dateOfBirthComponents()
    }

    /**
     Reads the user’s biological sex from the HealthKit store.

     If the user has not yet set his or her biological sex or if they have denied your app permission to read the biological sex, this method returns an ``HKBiologicalSex.notSet`` value.

     - Returns: A biological sex containing information about the user’s biological sex.
     */
    public func biologicalSex() throws -> HKBiologicalSex {
        try store.biologicalSex().biologicalSex
    }

    /**
     Reads the user’s blood type from the HealthKit store.

     If the user has not specified a blood type or if the user has denied your app permission to read the blood type, this method returns an ``HKBloodType.notSet`` value.
     - Returns: A blood type that contains information about the user’s blood type.
     */
    public func bloodType() throws -> HKBloodType {
        try store.bloodType().bloodType
    }

    /**
     Reads the user’s Fitzpatrick Skin Type from the HealthKit store.

     If the user has not yet specified a skin type, or if the user has denied your app permission to read the skin type, this method returns ``HKFitzpatrickSkinType.notSet``.

     - Returns: A skin type representing the skin type selected by the user.
     */
    public func fitzpatrickSkinType() throws -> HKFitzpatrickSkinType {
        try store.fitzpatrickSkinType().skinType
    }

    /**
     Reads the user’s wheelchair use from the HealthKit store.

     If the user has not yet specified their wheelchair use, or if the user has denied your app permission to read the wheelchair use, this method returns ``HKWheelchairUse.notSet``.

     - Returns: An type indicating whether the user uses a wheelchair.
     */
    public func wheelchairUse() throws -> HKWheelchairUse {
        try store.wheelchairUse().wheelchairUse
    }

    // MARK: - Working with HealthKit objects

    /**
     Returns the earliest date permitted for samples.

     Attempts to save samples earlier than this date fail with an ``HKError.Code.errorInvalidArgument`` error.
     Attempts to query samples before this date return samples after this date.

     - Returns: The earliest date that samples can use. You cannot save or query samples prior to this date.
     */
    public func earliestPermittedSampleDate() -> Date {
        store.earliestPermittedSampleDate()
    }

    // MARK: - Accessing the move mode

    /**
     Returns the activity move mode for the current user.
     */
    public func activityMoveMode() throws -> HKActivityMoveMode {
        try store.activityMoveMode().activityMoveMode
    }
}
