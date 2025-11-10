part of 'generated.dart';

class GetApplicationsForOpportunityVariablesBuilder {
  String opportunityId;

  final FirebaseDataConnect _dataConnect;
  GetApplicationsForOpportunityVariablesBuilder(this._dataConnect, {required  this.opportunityId,});
  Deserializer<GetApplicationsForOpportunityData> dataDeserializer = (dynamic json)  => GetApplicationsForOpportunityData.fromJson(jsonDecode(json));
  Serializer<GetApplicationsForOpportunityVariables> varsSerializer = (GetApplicationsForOpportunityVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<GetApplicationsForOpportunityData, GetApplicationsForOpportunityVariables>> execute() {
    return ref().execute();
  }

  QueryRef<GetApplicationsForOpportunityData, GetApplicationsForOpportunityVariables> ref() {
    GetApplicationsForOpportunityVariables vars= GetApplicationsForOpportunityVariables(opportunityId: opportunityId,);
    return _dataConnect.query("GetApplicationsForOpportunity", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class GetApplicationsForOpportunityApplications {
  final String id;
  final GetApplicationsForOpportunityApplicationsVolunteer volunteer;
  final String? coverLetter;
  final String status;
  GetApplicationsForOpportunityApplications.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']),
  volunteer = GetApplicationsForOpportunityApplicationsVolunteer.fromJson(json['volunteer']),
  coverLetter = json['coverLetter'] == null ? null : nativeFromJson<String>(json['coverLetter']),
  status = nativeFromJson<String>(json['status']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetApplicationsForOpportunityApplications otherTyped = other as GetApplicationsForOpportunityApplications;
    return id == otherTyped.id && 
    volunteer == otherTyped.volunteer && 
    coverLetter == otherTyped.coverLetter && 
    status == otherTyped.status;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, volunteer.hashCode, coverLetter.hashCode, status.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    json['volunteer'] = volunteer.toJson();
    if (coverLetter != null) {
      json['coverLetter'] = nativeToJson<String?>(coverLetter);
    }
    json['status'] = nativeToJson<String>(status);
    return json;
  }

  GetApplicationsForOpportunityApplications({
    required this.id,
    required this.volunteer,
    this.coverLetter,
    required this.status,
  });
}

@immutable
class GetApplicationsForOpportunityApplicationsVolunteer {
  final String id;
  final String displayName;
  final String email;
  GetApplicationsForOpportunityApplicationsVolunteer.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']),
  displayName = nativeFromJson<String>(json['displayName']),
  email = nativeFromJson<String>(json['email']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetApplicationsForOpportunityApplicationsVolunteer otherTyped = other as GetApplicationsForOpportunityApplicationsVolunteer;
    return id == otherTyped.id && 
    displayName == otherTyped.displayName && 
    email == otherTyped.email;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, displayName.hashCode, email.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    json['displayName'] = nativeToJson<String>(displayName);
    json['email'] = nativeToJson<String>(email);
    return json;
  }

  GetApplicationsForOpportunityApplicationsVolunteer({
    required this.id,
    required this.displayName,
    required this.email,
  });
}

@immutable
class GetApplicationsForOpportunityData {
  final List<GetApplicationsForOpportunityApplications> applications;
  GetApplicationsForOpportunityData.fromJson(dynamic json):
  
  applications = (json['applications'] as List<dynamic>)
        .map((e) => GetApplicationsForOpportunityApplications.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetApplicationsForOpportunityData otherTyped = other as GetApplicationsForOpportunityData;
    return applications == otherTyped.applications;
    
  }
  @override
  int get hashCode => applications.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['applications'] = applications.map((e) => e.toJson()).toList();
    return json;
  }

  GetApplicationsForOpportunityData({
    required this.applications,
  });
}

@immutable
class GetApplicationsForOpportunityVariables {
  final String opportunityId;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  GetApplicationsForOpportunityVariables.fromJson(Map<String, dynamic> json):
  
  opportunityId = nativeFromJson<String>(json['opportunityId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetApplicationsForOpportunityVariables otherTyped = other as GetApplicationsForOpportunityVariables;
    return opportunityId == otherTyped.opportunityId;
    
  }
  @override
  int get hashCode => opportunityId.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['opportunityId'] = nativeToJson<String>(opportunityId);
    return json;
  }

  GetApplicationsForOpportunityVariables({
    required this.opportunityId,
  });
}

