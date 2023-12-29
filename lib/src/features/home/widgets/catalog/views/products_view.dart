import 'package:flutter/material.dart';
import 'package:fomet_api_client/fomet_api_client.dart';
import 'package:fomet_app/src/features/home/widgets/catalog/inherited_catalog_state.dart';
import 'package:fomet_app/src/features/home/widgets/catalog/section_header.dart';
import 'package:fomet_app/src/localization/localization.dart';
import 'package:fomet_app/src/utils/extensions.dart';
import 'package:fomet_app/src/utils/widgets/fomet_future_builder.dart';
import 'package:fomet_ui/fomet_ui.dart';

class ProductsView extends StatefulWidget {
  final PageController controller;
  const ProductsView({
    required this.controller,
    super.key,
  });

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  late final future = FometCatalogProductClient(
    categoryCode: context.catalogState.category.code,
    varietyCode: context.catalogState.variety.code,
    kindCode: context.catalogState.kind.code,
    languageCode: context.languageCode,
  ).execute();

  Future<void> onItemTap(FometCatalogItem item) async {
    context.catalogState.product = item;
    await widget.controller.animateToPage(
      4,
      duration: const Duration(milliseconds: 600),
      curve: Curves.linear,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(
          title: context.l10n.products,
          backButtonTap: () async => widget.controller.animateToPage(
            2,
            duration: const Duration(milliseconds: 600),
            curve: Curves.linear,
          ),
        ),
        Expanded(
          child: FometFutureBuilder<List<FometCatalogItem>>(
            future: future,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            onSuccess: (data) {
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final item = data[index];

                  return ListTile(
                    onTap: () async => onItemTap(item),
                    title: Text(
                      item.description,
                      style: FometTypography.regular,
                    ),
                    subtitle: Text(
                      item.code,
                      style: FometTypography.semiBold.copyWith(
                        color: FometColors.secondary,
                        fontSize: 12,
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
