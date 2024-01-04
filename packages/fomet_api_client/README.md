# fomet_api_client

The `fomet_api_client` package exports a series of HTTP clients that communicate with the Fomet web service to retrieve products information. All URIs and endpoints can be found in the `src/configurations.dart` file. There are two folders in `src/`:

  1. `clients/`: contains all HTTP clients that are exported outside of the package. 
  2. `parsers/`: contains all XML parsers that are internally used by HTTP clients. Classes within this folder are **not** exported outside of the package.

The `FometBaseClient` base class is the supertype of all clients and defines the `fometGetRequest` method. It should **always** be used to make HTTP calls inside `execute` (or other helper methods) because it configures all headers and query parameters automatically. For example:

```dart
// GOOD
Future<String> execute() async {
  final response = await fometGetRequest(
    queryParameters: {'a': 'b'},
  );
  return response.body;
}

// BAD
Future<String> execute() async {
  final response = await http.get(...);
  return response.body;
}
```

The usage `fometGetRequest` favors maintainability and avoids code duplication.