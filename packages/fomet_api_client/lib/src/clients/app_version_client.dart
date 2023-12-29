import 'package:fomet_api_client/src/clients/fomet_base_client.dart';
import 'package:fomet_api_client/src/configuration.dart';
import 'package:http/http.dart' as http;

base class FometAppVersionClient extends FometBaseClient<bool> {
  final String currentVersionCode;

  /// Creates a [FometAppVersionClient] client.
  const FometAppVersionClient({
    required this.currentVersionCode,
  }) : super(endpoint: appVersionEndpoint);

  @override
  Future<bool> execute() async {
    final response = await http.get(
      buildEndpointUri(),
      headers: headers,
    );
    return response.body.contains('>$currentVersionCode<');
  }
}
