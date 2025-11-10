# dataconnect_generated SDK

## Installation
```sh
flutter pub get firebase_data_connect
flutterfire configure
```
For more information, see [Flutter for Firebase installation documentation](https://firebase.google.com/docs/data-connect/flutter-sdk#use-core).

## Data Connect instance
Each connector creates a static class, with an instance of the `DataConnect` class that can be used to connect to your Data Connect backend and call operations.

### Connecting to the emulator

```dart
String host = 'localhost'; // or your host name
int port = 9399; // or your port number
ExampleConnector.instance.dataConnect.useDataConnectEmulator(host, port);
```

You can also call queries and mutations by using the connector class.
## Queries

### ListOpportunities
#### Required Arguments
```dart
// No required arguments
ExampleConnector.instance.listOpportunities().execute();
```



#### Return Type
`execute()` returns a `QueryResult<ListOpportunitiesData, void>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await ExampleConnector.instance.listOpportunities();
ListOpportunitiesData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
final ref = ExampleConnector.instance.listOpportunities().ref();
ref.execute();

ref.subscribe(...);
```


### GetApplicationsForOpportunity
#### Required Arguments
```dart
String opportunityId = ...;
ExampleConnector.instance.getApplicationsForOpportunity(
  opportunityId: opportunityId,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<GetApplicationsForOpportunityData, GetApplicationsForOpportunityVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await ExampleConnector.instance.getApplicationsForOpportunity(
  opportunityId: opportunityId,
);
GetApplicationsForOpportunityData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String opportunityId = ...;

final ref = ExampleConnector.instance.getApplicationsForOpportunity(
  opportunityId: opportunityId,
).ref();
ref.execute();

ref.subscribe(...);
```

## Mutations

### CreateVolunteerHour
#### Required Arguments
```dart
DateTime date = ...;
int hours = ...;
String opportunityId = ...;
String volunteerId = ...;
ExampleConnector.instance.createVolunteerHour(
  date: date,
  hours: hours,
  opportunityId: opportunityId,
  volunteerId: volunteerId,
).execute();
```

#### Optional Arguments
We return a builder for each query. For CreateVolunteerHour, we created `CreateVolunteerHourBuilder`. For queries and mutations with optional parameters, we return a builder class.
The builder pattern allows Data Connect to distinguish between fields that haven't been set and fields that have been set to null. A field can be set by calling its respective setter method like below:
```dart
class CreateVolunteerHourVariablesBuilder {
  ...
   CreateVolunteerHourVariablesBuilder notes(String? t) {
   _notes.value = t;
   return this;
  }

  ...
}
ExampleConnector.instance.createVolunteerHour(
  date: date,
  hours: hours,
  opportunityId: opportunityId,
  volunteerId: volunteerId,
)
.notes(notes)
.execute();
```

#### Return Type
`execute()` returns a `OperationResult<CreateVolunteerHourData, CreateVolunteerHourVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await ExampleConnector.instance.createVolunteerHour(
  date: date,
  hours: hours,
  opportunityId: opportunityId,
  volunteerId: volunteerId,
);
CreateVolunteerHourData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
DateTime date = ...;
int hours = ...;
String opportunityId = ...;
String volunteerId = ...;

final ref = ExampleConnector.instance.createVolunteerHour(
  date: date,
  hours: hours,
  opportunityId: opportunityId,
  volunteerId: volunteerId,
).ref();
ref.execute();
```


### UpdateOrganization
#### Required Arguments
```dart
String id = ...;
ExampleConnector.instance.updateOrganization(
  id: id,
).execute();
```

#### Optional Arguments
We return a builder for each query. For UpdateOrganization, we created `UpdateOrganizationBuilder`. For queries and mutations with optional parameters, we return a builder class.
The builder pattern allows Data Connect to distinguish between fields that haven't been set and fields that have been set to null. A field can be set by calling its respective setter method like below:
```dart
class UpdateOrganizationVariablesBuilder {
  ...
   UpdateOrganizationVariablesBuilder name(String? t) {
   _name.value = t;
   return this;
  }
  UpdateOrganizationVariablesBuilder description(String? t) {
   _description.value = t;
   return this;
  }
  UpdateOrganizationVariablesBuilder address(String? t) {
   _address.value = t;
   return this;
  }
  UpdateOrganizationVariablesBuilder contactEmail(String? t) {
   _contactEmail.value = t;
   return this;
  }

  ...
}
ExampleConnector.instance.updateOrganization(
  id: id,
)
.name(name)
.description(description)
.address(address)
.contactEmail(contactEmail)
.execute();
```

#### Return Type
`execute()` returns a `OperationResult<UpdateOrganizationData, UpdateOrganizationVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await ExampleConnector.instance.updateOrganization(
  id: id,
);
UpdateOrganizationData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String id = ...;

final ref = ExampleConnector.instance.updateOrganization(
  id: id,
).ref();
ref.execute();
```

