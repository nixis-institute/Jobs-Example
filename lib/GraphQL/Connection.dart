import 'package:graphql_flutter/graphql_flutter.dart';
final HttpLink httpLink = HttpLink(
  uri: "https://api.graphql.jobs/",
);

GraphQLClient clientToQuery() {
  return GraphQLClient(
    // cache: OptimisticCache(dataIdFromObject: typenameDataIdFromObject),
    cache: InMemoryCache(),
    link: httpLink,
  );
}