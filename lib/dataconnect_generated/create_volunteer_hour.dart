part of 'generated.dart';

class CreateVolunteerHourVariablesBuilder {
  DateTime date;
  int hours;
  String opportunityId;
  Optional<String> _notes = Optional.optional(nativeFromJson, nativeToJson);
  String volunteerId;

  final FirebaseDataConnect _dataConnect;  CreateVolunteerHourVariablesBuilder notes(String? t) {
   _notes.value = t;
   return this;
  }

  CreateVolunteerHourVariablesBuilder(this._dataConnect, {required  this.date,required  this.hours,required  this.opportunityId,required  this.volunteerId,});
  Deserializer<CreateVolunteerHourData> dataDeserializer = (dynamic json)  => CreateVolunteerHourData.fromJson(jsonDecode(json));
  Serializer<CreateVolunteerHourVariables> varsSerializer = (CreateVolunteerHourVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<CreateVolunteerHourData, CreateVolunteerHourVariables>> execute() {
    return ref().execute();
  }

  MutationRef<CreateVolunteerHourData, CreateVolunteerHourVariables> ref() {
    CreateVolunteerHourVariables vars= CreateVolunteerHourVariables(date: date,hours: hours,opportunityId: opportunityId,notes: _notes,volunteerId: volunteerId,);
    return _dataConnect.mutation("CreateVolunteerHour", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class CreateVolunteerHourVolunteerHourInsert {
  final String id;
  CreateVolunteerHourVolunteerHourInsert.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final CreateVolunteerHourVolunteerHourInsert otherTyped = other as CreateVolunteerHourVolunteerHourInsert;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  CreateVolunteerHourVolunteerHourInsert({
    required this.id,
  });
}

@immutable
class CreateVolunteerHourData {
  final CreateVolunteerHourVolunteerHourInsert volunteerHour_insert;
  CreateVolunteerHourData.fromJson(dynamic json):
  
  volunteerHour_insert = CreateVolunteerHourVolunteerHourInsert.fromJson(json['volunteerHour_insert']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final CreateVolunteerHourData otherTyped = other as CreateVolunteerHourData;
    return volunteerHour_insert == otherTyped.volunteerHour_insert;
    
  }
  @override
  int get hashCode => volunteerHour_insert.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['volunteerHour_insert'] = volunteerHour_insert.toJson();
    return json;
  }

  CreateVolunteerHourData({
    required this.volunteerHour_insert,
  });
}

@immutable
class CreateVolunteerHourVariables {
  final DateTime date;
  final int hours;
  final String opportunityId;
  late final Optional<String>notes;
  final String volunteerId;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  CreateVolunteerHourVariables.fromJson(Map<String, dynamic> json):
  
  date = nativeFromJson<DateTime>(json['date']),
  hours = nativeFromJson<int>(json['hours']),
  opportunityId = nativeFromJson<String>(json['opportunityId']),
  volunteerId = nativeFromJson<String>(json['volunteerId']) {
  
  
  
  
  
    notes = Optional.optional(nativeFromJson, nativeToJson);
    notes.value = json['notes'] == null ? null : nativeFromJson<String>(json['notes']);
  
  
  }
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final CreateVolunteerHourVariables otherTyped = other as CreateVolunteerHourVariables;
    return date == otherTyped.date && 
    hours == otherTyped.hours && 
    opportunityId == otherTyped.opportunityId && 
    notes == otherTyped.notes && 
    volunteerId == otherTyped.volunteerId;
    
  }
  @override
  int get hashCode => Object.hashAll([date.hashCode, hours.hashCode, opportunityId.hashCode, notes.hashCode, volunteerId.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['date'] = nativeToJson<DateTime>(date);
    json['hours'] = nativeToJson<int>(hours);
    json['opportunityId'] = nativeToJson<String>(opportunityId);
    if(notes.state == OptionalState.set) {
      json['notes'] = notes.toJson();
    }
    json['volunteerId'] = nativeToJson<String>(volunteerId);
    return json;
  }

  CreateVolunteerHourVariables({
    required this.date,
    required this.hours,
    required this.opportunityId,
    required this.notes,
    required this.volunteerId,
  });
}

