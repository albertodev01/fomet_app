import 'package:fomet_api_client/src/configuration.dart';
import 'package:http/http.dart' as http;

/// A base class for creating HTTP clients that make requests to the Fomet web
/// services.
///
/// To correctly build an [Uri] object that points to a resource, use the
/// [buildEndpointUri] method rather than hard-coding headers and query
/// parameters (if any).
abstract base class FometBaseClient<T> {
  /// The endpoint at which the HTTP request is made.
  final String endpoint;

  /// Creates a [FometBaseClient] object.
  const FometBaseClient({
    required this.endpoint,
  });

  /// Executes the HTTP call and returns the result [T].
  Future<T> execute();

  /// Headers that must always be included in the request.
  Map<String, String> get headers => const {'x-api-key': 'm2lw-apgy.skqzxs'};

  /// Builds the HTTPS uri based on [endpoint] and passes [queryParameters], if
  /// any. The authority is defined by [apiBaseAddress].
  Uri buildEndpointUri({Map<String, String> queryParameters = const {}}) {
    // Builds the path to the resource that will return the response. Slashes
    // should NOT be handled here.
    final path = '$servicePath$endpoint';

    // Returns the HTTPS uri that points to the resource on the server.
    return Uri.https(apiBaseAddress, path, queryParameters);
  }
}
