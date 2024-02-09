# HealthKit Extensions

Extensions for [Apple HealthKit](https://developer.apple.com/documentation/healthkit) to make the API easier to use. 
This includes:

- Dedicated types for all sample types
- Automatic unit conversions and metadata handling
- Typed reading and saving functions on `HKHealthStore`

## Examples

### Creating samples

Normally, one would create `HKSample` samples manually:

```swift
let metadata: [String: Any] = [HKMetadataKeySexualActivityProtectionUsed : true]
let sample = HKCategorySample(
    type: .init(.sexualActivity), 
    value: HKCategoryValue.notApplicable.rawValue, 
    start: .now, 
    end: .now,
    metadata: metadata)
```

Using the extensions, this becomes much easier:

```swift
let activity = SexualActivity(protectionUsed: true, start: .now, end: .now)
```

The types automatically use the correct sample identifier, and set the correct value and metadata fields for the specific type.
The created HealthKit sample can be accessed as a property:

```swift
let object: HKObject = activity.object
let sample: HKSample = activity.sample
let category: HKCategorySample = activity.categorySample
```

#### Category samples

Category samples either have a value (usually an enum) or don't allow a value.
Depending on the type, a value can be provided in the constructor:

```swift
let result = PregnancyTestResult(value: .positive, start: .now, end: .now)
let pregnancy = Pregnancy(start: now, end: now)
```

Whenever a category sample requires or allows additional metadata fields, it can be set using the constructor.
The types also expose these fields as properties.

```swift
let sample = SexualActivity(protectionUsed: true, start: .now, end: .now)
let wasSafe = sample.protectionUsed // Bool?
```

#### Quantity samples

`HKQuantitySample` types only include a quantity, which can be given to the constructor as a value or a quantity:

```swift
let value = BodyFatPercentage(value: 10.3, start: .now, end: .now)
```
```swift
let quantity = HKQuantity(unit: .precent(), doubleValue: 10.3)
let value = BodyFatPercentage(quantity: quantity, start: .now, end: .now)
```

When only the value is provided, then it is interpreted in the `defaultUnit` for the type.

#### Custom UUIDs

It's possible to assign custom UUIDs directly in the constructor:

```swift
let uuid = UUID()
let sample = SexualActivity(protectionUsed: true, start: .now, end: .now, uuid: uuid)
print(sample.preferredUUID == uuid) // true
```

#### Metadata Keys

When manipulating and accessing `HKSample` and `HKObject` types, there are many metadata keys required to get certain properties.
Most of the time, it's unnecessary to access metadata directly, since the types provide the expected fields as properties or constructor arguments. 
The library still provides a more convenient way to interact with metadata:

```swift
var metadata = Metadata() // typealias for [String : Any]
metadata[.menstrualCycleStart] = true // Sets HKMetadataKeyMenstrualCycleStart
let cycleStart: Bool = metadata[.menstrualCycleStart]
```


### Requesting permissions

Before saving or reading samples from HealthKit, the permissions must be obtained:

```swift
try await HKHealthStore().requestAuthorization(
    toShare: Vomiting.self, SoreThroat.self,
    read: SkippedHeartbeat.self, SleepChanges.self)
```

It's also possible to pass an array of types instead of variadic arguments.
To check the authorization status, there are also overloads:

```swift
let status = store.authorizationStatus(for: SexualActivity.self)
```

### Saving to the health store

There are function overloads to directly pass objects to the health store:

```swift
let sample = SexualActivity(...)
try await HKHealthStore().save(sample)
```

### Reading from the health store

There are additional functions for `HKHealthStore` to directly retrieve typed objects for quantities, category samples and correlations:

```swift
let predicate = HKQuery.predicateForSamples(withStart: Date.now, end: Date.now, options: [])
let samples: [Vo2Max] = try await HKHealthStore().read(
    predicate: predicate,
    sortDescriptors: [.init(\.startDate, order: .reverse)])
```
