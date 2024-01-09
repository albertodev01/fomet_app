import 'package:fomet_api_client/src/clients/fomet_base_client.dart';
import 'package:fomet_api_client/src/configuration.dart';

/// This client checks whether [currentVersionCode] matches the version code
/// returned by the server.
base class FometAppVersionClient extends FometBaseClient<bool> {
  /// The application's version code.
  final String currentVersionCode;

  /// Creates a [FometAppVersionClient] client.
  const FometAppVersionClient({
    required this.currentVersionCode,
    super.client,
  }) : super(endpoint: appVersionEndpoint);

  @override
  Future<bool> execute() async {
    final response = await fometGetRequest();
    return response.body.contains('>$currentVersionCode<');
  }
}
