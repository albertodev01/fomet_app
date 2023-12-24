import 'package:fomet_api_client/src/configuration.dart';

abstract base class FometBaseClient<T> {
  final String endpoint;
  const FometBaseClient({
    required this.endpoint,
  });

  Future<T> execute();

  /// Headers that must always be included in the request.
  Map<String, String> get headers => const {'x-api-key': 'm2lw-apgy.skqzxs'};

  /// Builds an HTTPS uri based on [endpoint] and passes [queryParameters], if
  /// any. The authority is defined by [apiBaseAddress].
  Uri buildEndpointUri({Map<String, String> queryParameters = const {}}) {
    // Builds the path to the resource that will return the response. Slashes
    // should NOT be handled here.
    final path = '$servicePath$endpoint';

    // Returns the HTTPS uri that points to the resource on the server.
    return Uri.https(apiBaseAddress, path, queryParameters);
  }
}
