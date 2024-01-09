import 'package:flutter/material.dart';
import 'package:fomet_api_client/fomet_api_client.dart';
import 'package:fomet_app/src/features/home/pages/catalog_page.dart';
import 'package:fomet_app/src/features/home/widgets/catalog/section_header.dart';
import 'package:fomet_app/src/localization/localization.dart';
import 'package:fomet_app/src/utils/extensions.dart';
import 'package:fomet_app/src/utils/widgets/fomet_future_builder.dart';
import 'package:fomet_app/src/utils/widgets/inherited_object.dart';
import 'package:fomet_ui/fomet_ui.dart';

/// A view of [CatalogPage] that allows selecting the variety of a product.
class VarietyView extends StatefulWidget {
  /// The parent's [PageController].
  final PageController controller;

  /// {@macro fomet_app.pages.mockClient}
  final FometMockClient? mockClient;

  /// Creates a [VarietyView] widget.
  const VarietyView({
    required this.controller,
    this.mockClient,
    super.key,
  });

  @override
  State<VarietyView> createState() => _VarietyViewState();
}

class _VarietyViewState extends State<VarietyView> {
  /// Fetches the varieties list.
  late final future = FometVarietyClient(
    categoryCode: context.catalogState.category.code,
    languageCode: context.languageCode,
    client: widget.mockClient,
  ).execute();

  /// Sets [item] as selected and moves to the next page.
  Future<void> onItemTap(FometCatalogItem item) async {
    // Set the variety.
    context.catalogState.variety = item;

    // Move to the next page.
    await widget.controller.animateToPage(
      2,
      duration: const Duration(milliseconds: 600),
      curve: Curves.linear,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(
          title: context.l10n.variety,
          backButtonTap: () async {
            // Clears the catalog kind.
            context.catalogState.variety = const (code: '', description: '');

            // Goes back to the previous page.
            await widget.controller.animateToPage(
              0,
              duration: const Duration(milliseconds: 600),
              curve: Curves.linear,
            );
          },
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
