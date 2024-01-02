import 'package:fomet_api_client/src/clients/fomet_base_client.dart';
import 'package:fomet_api_client/src/configuration.dart';

/// This client checks whether [productCode] is a valid product code or not.
///
/// For example, if [productCode] is not a valid product code then [execute]
/// returns `false`.
base class FometCodeValidationClient extends FometBaseClient<bool> {
  /// The product code.
  final String productCode;

  /// Creates a [FometCodeValidationClient] client.
  const FometCodeValidationClient({
    required this.productCode,
    super.client,
  }) : super(endpoint: codeValidationEndpoint);

  @override
  Future<bool> execute() async {
    final response = await fometGetRequest(
      queryParameters: {'mCodArt': productCode},
    );

    /*
     * The XML response is just a string that either contains 1 or 0 to indicate
     * (respectively) success or failure. It is easier to check for the pattern
     * rather than parsing the XML and reading the node value.  
     */
    return response.body.contains('>1<');
  }
}
