import 'package:flutter/material.dart';
import 'package:fomet_app/src/features/home/pages/catalog_page.dart';
import 'package:fomet_app/src/features/home/widgets/catalog/section_header.dart';
import 'package:fomet_app/src/localization/localization.dart';
import 'package:fomet_app/src/utils/widgets/inherited_object.dart';
import 'package:fomet_ui/fomet_ui.dart';

/// A view of [CatalogPage] that allows selecting the category of a product.
class KindView extends StatelessWidget {
  /// The parent's [PageController].
  final PageController controller;

  /// Creates a [KindView] widget.
  const KindView({
    required this.controller,
    super.key,
  });

  /// Sets [value] as selected and moves to the next page.
  Future<void> _onItemTap({
    required BuildContext context,
    required String value,
    required String description,
  }) async {
    // Set the kind.
    context.catalogState.kind = (code: value, description: description);

    // Move to the next page.
    await controller.animateToPage(
      3,
      duration: const Duration(milliseconds: 600),
      curve: Curves.linear,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(
          title: context.l10n.kind,
          backButtonTap: () async {
            // Clears the variety kind.
            context.catalogState.variety = const (code: '', description: '');

            // Goes back to the previous page.
            await controller.animateToPage(
              1,
              duration: const Duration(milliseconds: 600),
              curve: Curves.linear,
            );
          },
        ),
        Expanded(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FometCard(
                  onTap: () async => _onItemTap(
                    context: context,
                    value: '0',
                    description: context.l10n.conventional,
                  ),
                  content: Text(
                    context.l10n.conventional,
                    style: FometTypography.regular,
                  ),
                  trailingIcon: const Icon(Icons.chevron_right),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: FometCard(
                    onTap: () async => _onItemTap(
                      context: context,
                      value: '1',
                      description: context.l10n.biologic,
                    ),
                    content: Text(
                      context.l10n.biologic,
                      style: FometTypography.regular,
                    ),
                    trailingIcon: const Icon(Icons.chevron_right),
                  ),
                ),
                FometCard(
                  onTap: () async => _onItemTap(
                    context: context,
                    value: '2',
                    description: context.l10n.biodynamic,
                  ),
                  content: Text(
                    context.l10n.biodynamic,
                    style: FometTypography.regular,
                  ),
                  trailingIcon: const Icon(Icons.chevron_right),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
