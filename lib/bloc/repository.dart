import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:myjobs/GraphQL/Connection.dart';
import 'package:myjobs/GraphQL/Queries.dart';
import 'package:myjobs/bloc/jobs_bloc.dart';
import 'jobsModel.dart';

class Repository{
  GraphQLClient _client = clientToQuery();

  Future<List<JobsModel>> fetchAllJobs() async{
    QueryResult result = await _client.query(
      QueryOptions(
        documentNode: gql(getAllJobsQuery)
      )
    );

    if(!result.hasException)
    {
      List data = result.data["jobs"];
      List<JobsModel> jobs =[];
      data.forEach((e){
        jobs.add(
          JobsModel(
            id: e["id"],
            title: e["title"],
            applyUrl: e["applyUrl"],
            locationNames: e["locationNames"],
            userEmail:e["userEmail"],
            createdAt:e["createdAt"],
            company: e["company"]["name"]
            )
        );
      });
      return jobs;
    }
  }

}
