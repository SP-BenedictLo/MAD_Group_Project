part of 'generated.dart';

class UpdateOrganizationVariablesBuilder {
  String id;
  Optional<String> _name = Optional.optional(nativeFromJson, nativeToJson);
  Optional<String> _description = Optional.optional(nativeFromJson, nativeToJson);
  Optional<String> _address = Optional.optional(nativeFromJson, nativeToJson);
  Optional<String> _contactEmail = Optional.optional(nativeFromJson, nativeToJson);

  final FirebaseDataConnect _dataConnect;  UpdateOrganizationVariablesBuilder name(String? t) {
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

  UpdateOrganizationVariablesBuilder(this._dataConnect, {required  this.id,});
  Deserializer<UpdateOrganizationData> dataDeserializer = (dynamic json)  => UpdateOrganizationData.fromJson(jsonDecode(json));
  Serializer<UpdateOrganizationVariables> varsSerializer = (UpdateOrganizationVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<UpdateOrganizationData, UpdateOrganizationVariables>> execute() {
    return ref().execute();
  }

  MutationRef<UpdateOrganizationData, UpdateOrganizationVariables> ref() {
    UpdateOrganizationVariables vars= UpdateOrganizationVariables(id: id,name: _name,description: _description,address: _address,contactEmail: _contactEmail,);
    return _dataConnect.mutation("UpdateOrganization", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class UpdateOrganizationOrganizationUpdate {
  final String id;
  UpdateOrganizationOrganizationUpdate.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final UpdateOrganizationOrganizationUpdate otherTyped = other as UpdateOrganizationOrganizationUpdate;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  UpdateOrganizationOrganizationUpdate({
    required this.id,
  });
}

@immutable
class UpdateOrganizationData {
  final UpdateOrganizationOrganizationUpdate? organization_update;
  UpdateOrganizationData.fromJson(dynamic json):
  
  organization_update = json['organization_update'] == null ? null : UpdateOrganizationOrganizationUpdate.fromJson(json['organization_update']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final UpdateOrganizationData otherTyped = other as UpdateOrganizationData;
    return organization_update == otherTyped.organization_update;
    
  }
  @override
  int get hashCode => organization_update.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (organization_update != null) {
      json['organization_update'] = organization_update!.toJson();
    }
    return json;
  }

  UpdateOrganizationData({
    this.organization_update,
  });
}

@immutable
class UpdateOrganizationVariables {
  final String id;
  late final Optional<String>name;
  late final Optional<String>description;
  late final Optional<String>address;
  late final Optional<String>contactEmail;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  UpdateOrganizationVariables.fromJson(Map<String, dynamic> json):
  
  id = nativeFromJson<String>(json['id']) {
  
  
  
    name = Optional.optional(nativeFromJson, nativeToJson);
    name.value = json['name'] == null ? null : nativeFromJson<String>(json['name']);
  
  
    description = Optional.optional(nativeFromJson, nativeToJson);
    description.value = json['description'] == null ? null : nativeFromJson<String>(json['description']);
  
  
    address = Optional.optional(nativeFromJson, nativeToJson);
    address.value = json['address'] == null ? null : nativeFromJson<String>(json['address']);
  
  
    contactEmail = Optional.optional(nativeFromJson, nativeToJson);
    contactEmail.value = json['contactEmail'] == null ? null : nativeFromJson<String>(json['contactEmail']);
  
  }
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final UpdateOrganizationVariables otherTyped = other as UpdateOrganizationVariables;
    return id == otherTyped.id && 
    name == otherTyped.name && 
    description == otherTyped.description && 
    address == otherTyped.address && 
    contactEmail == otherTyped.contactEmail;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, name.hashCode, description.hashCode, address.hashCode, contactEmail.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    if(name.state == OptionalState.set) {
      json['name'] = name.toJson();
    }
    if(description.state == OptionalState.set) {
      json['description'] = description.toJson();
    }
    if(address.state == OptionalState.set) {
      json['address'] = address.toJson();
    }
    if(contactEmail.state == OptionalState.set) {
      json['contactEmail'] = contactEmail.toJson();
    }
    return json;
  }

  UpdateOrganizationVariables({
    required this.id,
    required this.name,
    required this.description,
    required this.address,
    required this.contactEmail,
  });
}

