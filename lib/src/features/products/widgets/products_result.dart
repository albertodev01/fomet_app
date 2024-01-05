import 'package:flutter/material.dart';
import 'package:fomet_api_client/fomet_api_client.dart';
import 'package:fomet_app/src/routing/route_names.dart';
import 'package:fomet_app/src/utils/widgets/inherited_object.dart';
import 'package:fomet_ui/fomet_ui.dart';
import 'package:go_router/go_router.dart';

class ProductsResult extends StatelessWidget {
  final List<FometProduct> products;
  const ProductsResult({
    required this.products,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final element = products[index];

        return ListTile(
          onTap: () {
            context.productsPageState.selectedProduct = element;
            context.go('$productsPagePath/$productDetailsPath');
          },
          title: Text(
            element.description,
            style: FometTypography.regular,
          ),
          subtitle: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                element.categoryDescription,
                style: FometTypography.regular,
              ),
              Text(
                element.varietyDescription,
                style: FometTypography.regular,
              ),
            ],
          ),
        );
      },
      separatorBuilder: (_, __) => const SizedBox(height: 16),
    );
  }
}
