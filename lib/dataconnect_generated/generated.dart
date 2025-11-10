library dataconnect_generated;
import 'package:firebase_data_connect/firebase_data_connect.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';

part 'create_volunteer_hour.dart';

part 'list_opportunities.dart';

part 'update_organization.dart';

part 'get_applications_for_opportunity.dart';







class ExampleConnector {
  
  
  CreateVolunteerHourVariablesBuilder createVolunteerHour ({required DateTime date, required int hours, required String opportunityId, required String volunteerId, }) {
    return CreateVolunteerHourVariablesBuilder(dataConnect, date: date,hours: hours,opportunityId: opportunityId,volunteerId: volunteerId,);
  }
  
  
  ListOpportunitiesVariablesBuilder listOpportunities () {
    return ListOpportunitiesVariablesBuilder(dataConnect, );
  }
  
  
  UpdateOrganizationVariablesBuilder updateOrganization ({required String id, }) {
    return UpdateOrganizationVariablesBuilder(dataConnect, id: id,);
  }
  
  
  GetApplicationsForOpportunityVariablesBuilder getApplicationsForOpportunity ({required String opportunityId, }) {
    return GetApplicationsForOpportunityVariablesBuilder(dataConnect, opportunityId: opportunityId,);
  }
  

  static ConnectorConfig connectorConfig = ConnectorConfig(
    'us-east1',
    'example',
    'madgroupproject',
  );

  ExampleConnector({required this.dataConnect});
  static ExampleConnector get instance {
    return ExampleConnector(
        dataConnect: FirebaseDataConnect.instanceFor(
            connectorConfig: connectorConfig,
            sdkType: CallerSDKType.generated));
  }

  FirebaseDataConnect dataConnect;
}

