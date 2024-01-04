import 'package:fomet_api_client/src/configuration.dart';
import 'package:http/http.dart' as http;

/// A base class for creating HTTP clients that make requests to the Fomet web
/// services.
///
/// Subclasses should always use the [fometGetRequest] method to make GET
/// requests to the Fomet web services. It configures Uris, headers and query
/// parameters automatically.
///
/// The [client] parameter is useful if you want to provide a custom client for
/// a long-lived connection or in a test environment to provide mocks.
abstract base class FometBaseClient<T> {
  /// The endpoint at which the HTTP request is made.
  final String endpoint;

  /// This client could be used to keep a long-lived connection or in unit tests
  /// for mocking requests.
  ///
  /// By default, this is set to `null` and a default client is used.
  final http.Client? client;

  /// Creates a [FometBaseClient] object.
  const FometBaseClient({
    required this.endpoint,
    this.client,
  });

  /// Executes the HTTP call and returns the result [T].
  Future<T> execute();

  /// Makes a GET request to the Fomet web service and automatically configures
  /// headers. If [client] is `null`, a default one is used.
  Future<http.Response> fometGetRequest({
    Map<String, String> queryParameters = const {},
  }) async {
    final uri = Uri.https(
      apiBaseAddress,
      '$servicePath$endpoint',
      queryParameters,
    );

    if (client != null) {
      return client!.get(uri, headers: headers);
    } else {
      // This is ignored because it will be tested by integration and QA tests.
      return http.get(uri, headers: headers); // coverage:ignore-line
    }
  }
}
