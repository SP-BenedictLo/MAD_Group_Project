part of 'generated.dart';

class ListOpportunitiesVariablesBuilder {
  
  final FirebaseDataConnect _dataConnect;
  ListOpportunitiesVariablesBuilder(this._dataConnect, );
  Deserializer<ListOpportunitiesData> dataDeserializer = (dynamic json)  => ListOpportunitiesData.fromJson(jsonDecode(json));
  
  Future<QueryResult<ListOpportunitiesData, void>> execute() {
    return ref().execute();
  }

  QueryRef<ListOpportunitiesData, void> ref() {
    
    return _dataConnect.query("ListOpportunities", dataDeserializer, emptySerializer, null);
  }
}

@immutable
class ListOpportunitiesOpportunities {
  final String id;
  final String title;
  final String description;
  final String location;
  final DateTime startDate;
  final DateTime endDate;
  final String timeCommitment;
  final List<String> requiredSkills;
  ListOpportunitiesOpportunities.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']),
  title = nativeFromJson<String>(json['title']),
  description = nativeFromJson<String>(json['description']),
  location = nativeFromJson<String>(json['location']),
  startDate = nativeFromJson<DateTime>(json['startDate']),
  endDate = nativeFromJson<DateTime>(json['endDate']),
  timeCommitment = nativeFromJson<String>(json['timeCommitment']),
  requiredSkills = (json['requiredSkills'] as List<dynamic>)
        .map((e) => nativeFromJson<String>(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListOpportunitiesOpportunities otherTyped = other as ListOpportunitiesOpportunities;
    return id == otherTyped.id && 
    title == otherTyped.title && 
    description == otherTyped.description && 
    location == otherTyped.location && 
    startDate == otherTyped.startDate && 
    endDate == otherTyped.endDate && 
    timeCommitment == otherTyped.timeCommitment && 
    requiredSkills == otherTyped.requiredSkills;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, title.hashCode, description.hashCode, location.hashCode, startDate.hashCode, endDate.hashCode, timeCommitment.hashCode, requiredSkills.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    json['title'] = nativeToJson<String>(title);
    json['description'] = nativeToJson<String>(description);
    json['location'] = nativeToJson<String>(location);
    json['startDate'] = nativeToJson<DateTime>(startDate);
    json['endDate'] = nativeToJson<DateTime>(endDate);
    json['timeCommitment'] = nativeToJson<String>(timeCommitment);
    json['requiredSkills'] = requiredSkills.map((e) => nativeToJson<String>(e)).toList();
    return json;
  }

  ListOpportunitiesOpportunities({
    required this.id,
    required this.title,
    required this.description,
    required this.location,
    required this.startDate,
    required this.endDate,
    required this.timeCommitment,
    required this.requiredSkills,
  });
}

@immutable
class ListOpportunitiesData {
  final List<ListOpportunitiesOpportunities> opportunities;
  ListOpportunitiesData.fromJson(dynamic json):
  
  opportunities = (json['opportunities'] as List<dynamic>)
        .map((e) => ListOpportunitiesOpportunities.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListOpportunitiesData otherTyped = other as ListOpportunitiesData;
    return opportunities == otherTyped.opportunities;
    
  }
  @override
  int get hashCode => opportunities.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['opportunities'] = opportunities.map((e) => e.toJson()).toList();
    return json;
  }

  ListOpportunitiesData({
    required this.opportunities,
  });
}

