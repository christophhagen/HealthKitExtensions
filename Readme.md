# HealthKit Extensions

Extensions for [Apple HealthKit](https://developer.apple.com/documentation/healthkit) to make the API easier to use. 
This includes:

- Dedicated types for all sample types
- Automatic unit conversions and metadata handling
- A wrapper around `HKHealthStore` for easier querying and saving

## Samples

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

#### Cumulative and discrete samples

Depending on the quantity, there are different properties exposed for samples that are either `cumulative` or `discrete`.
Cumulative samples have an `aggregationStyle == .cumulative` and provide the `sumQuantity` property.

```swift
let sample = ActiveEnergyBurned(...)
let sum = sample.sumQuantity
```

Discrete samples have `aggregationStyle` values of `.discreteArithmetic`, `.discreteTemporallyWeighted`, or `.discreteEquivalentContinuousLevel` and expose the properties `averageQuantity`, `maximumQuantity`, `minimumQuantity`, `mostRecentQuantity`, and `mostRecentQuantityDateInterval`.

```swift
let sample = CyclingPower(...)
let max = sample.maximumQuantity
```

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

## Queries

Interacting with the `HKHealthStore` can be simplified by wrapping it in a `HealthStore`:

```swift
let store = HealthStore(wrapping: HKHealthStore())
```

It's then possible to use all the convenience functions on `HealthStore`, or (for complex queries) just use the `store: HKHealthStore` property as oine normally would.

The `HealthStore` functions make a lot of use of `async`/`await` instead of completion handlers, and use the convenience sample types described above.

### Requesting permissions

Before saving or reading samples from HealthKit, the permissions must be obtained:

```swift
try await store.requestAuthorization(
    toShare: Vomiting.self, SoreThroat.self,
    read: SkippedHeartbeat.self, SleepChanges.self)
```

It's also possible to pass an array of types instead of variadic arguments.
To check the authorization status, there are also overloads:

```swift
let status = store.authorizationStatus(for: SexualActivity.self)
```

### User characteristics

All user characteristic functions of `HKHealthStore` have been mapped to `HealthStore`, but directly returning the value instead of the object.

```swift
let sex: HKBiologicalSex = try store.biologicalSex() 
```

### Saving to the health store

There are function overloads to directly pass objects to the health store:

```swift
let sample = SexualActivity(...)
try await store.save(sample)
```

### Reading samples

There are functions to directly retrieve typed objects for quantities, category samples and correlations:

```swift
let samples: [Vo2Max] = try await store.read(
    from: Date.distantPast,
    to: Date.now,
    sortedBy: .ascendingStartDate,
    limitedTo: 100)
```

### Workouts 

```swift
let runs = try await store.read(
    activityType: .running,
    from: Date.distantPast,
    to: Date.now,
    sortedBy: .ascendingStartDate,
    limitedTo: 100)
```

### Workout samples

```swift
let workout: HKWorkout = runs.first!
let heartRates: [HeartRate] = try await store
    .samples(associatedWith: workout)
```

The function automatically queries for [condensed samples](https://developer.apple.com/documentation/healthkit/workouts_and_activity_rings/accessing_condensed_workout_samples), and returns all samples at once.

### Workout route and locations

```swift
let route = try store.route(associatedWith: workout)
let locations = try store.locations(associatedWith: route!)
```