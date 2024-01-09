import 'package:flutter/material.dart';
import 'package:fomet_api_client/fomet_api_client.dart';
import 'package:fomet_app/src/features/home/pages/catalog_page.dart';
import 'package:fomet_app/src/features/home/widgets/catalog/section_header.dart';
import 'package:fomet_app/src/localization/localization.dart';
import 'package:fomet_app/src/utils/extensions.dart';
import 'package:fomet_app/src/utils/widgets/fomet_future_builder.dart';
import 'package:fomet_app/src/utils/widgets/inherited_object.dart';
import 'package:fomet_ui/fomet_ui.dart';

/// A view of [CatalogPage] that allows selecting the category of a product.
class CategoryView extends StatefulWidget {
  /// The parent's [PageController].
  final PageController controller;

  /// {@macro fomet_app.pages.mockClient}
  final FometMockClient? mockClient;

  /// Creates a [CategoryView] widget.
  const CategoryView({
    required this.controller,
    this.mockClient,
    super.key,
  });

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  /// Fetches the categories list.
  late final future = FometCategoryClient(
    languageCode: context.languageCode,
    client: widget.mockClient,
  ).execute();

  /// Sets [item] as selected and moves to the next page.
  Future<void> onItemTap(FometCatalogItem item) async {
    // Sets the category.
    context.catalogState.category = item;

    // Move to the next page.
    await widget.controller.animateToPage(
      1,
      duration: const Duration(milliseconds: 600),
      curve: Curves.linear,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(
          title: context.l10n.category,
        ),
        Expanded(
          child: FometFutureBuilder<List<FometCatalogItem>>(
            future: future,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            onSuccess: (data) {
              return ListView.separated(
                itemCount: data.length,
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final item = data[index];

                  return FometCard(
                    onTap: () async => onItemTap(item),
                    content: Text(
                      item.description,
                      style: FometTypography.regular,
                    ),
                    secondaryContent: Text(
                      item.code,
                      style: FometTypography.semiBold.copyWith(
                        color: FometColors.secondary,
                        fontSize: 12,
                      ),
                    ),
                    trailingIcon: const Icon(Icons.chevron_right),
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
