import 'package:flutter/material.dart';
import 'package:fomet_api_client/fomet_api_client.dart';
import 'package:fomet_app/src/features/products/pages/product_details_page.dart';
import 'package:fomet_app/src/features/products/pages/products_page.dart';
import 'package:fomet_app/src/features/products/widgets/products_result.dart';

/// The state of the [ProductsPage] page.
final class ProductsPageState {
  /// List of all products fetched by [FometProductsClient].
  List<FometProduct> products = const [];

  /// A listenable list of [FometProduct] that is updated when the user searches
  /// for a product.
  ValueNotifier<List<FometProduct>> filteredProducts = ValueNotifier(const []);

  /// The product selected by the user from the list in [ProductsResult]. This
  /// is later used by [ProductsDetailsPage] to know which [FometProduct] the
  /// user selected in the previous page.
  ///
  /// By default, this is set to `null`.
  FometProduct? selectedProduct;
}
