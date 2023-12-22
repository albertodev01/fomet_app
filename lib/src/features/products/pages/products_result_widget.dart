import 'package:flutter/material.dart';
import 'package:fomet_api_client/fomet_api_client.dart';
import 'package:fomet_ui/fomet_ui.dart';

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
          title: Text(
            element.description,
            style: FometTypography.regular,
          ),
          subtitle: Text(
            element.code,
            style: FometTypography.semiBold,
          ),
        );
      },
      separatorBuilder: (_, __) => const SizedBox(height: 16),
    );
  }
}
