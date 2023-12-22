import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fomet_api_client/fomet_api_client.dart';
import 'package:fomet_app/src/features/products/pages/products_result_widget.dart';
import 'package:fomet_app/src/features/products/widgets/products_loading_widget.dart';
import 'package:fomet_app/src/utils/widgets/loading_error_widget.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  late final future = FometProductsClient(
    languageCode: Localizations.localeOf(context).languageCode.toUpperCase(),
    noDuplicateCodes: true,
  ).execute();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<FometProduct>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ProductsResult(products: snapshot.requireData);
        }

        if (snapshot.hasError) {
          return const LoadingErrorWidget();
        }

        return const ProductsLoadingIndicator();
      },
    );
  }
}
