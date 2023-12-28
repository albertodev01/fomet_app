import 'package:fomet_api_client/src/clients/fomet_base_client.dart';
import 'package:fomet_api_client/src/configuration.dart';
import 'package:http/http.dart' as http;

base class FometCodeValidationClient extends FometBaseClient<bool> {
  final String productCode;

  /// Creates a [FometCodeValidationClient] client.
  const FometCodeValidationClient({
    required this.productCode,
  }) : super(endpoint: codeValidationEndpoint);

  @override
  Future<bool> execute() async {
    final uri = buildEndpointUri(
      queryParameters: {'mCodArt': productCode},
    );

    final response = await http.get(uri, headers: headers);
    return response.body.contains('>1<');
  }
}
