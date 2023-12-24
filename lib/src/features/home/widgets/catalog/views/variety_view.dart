import 'package:flutter/material.dart';
import 'package:fomet_api_client/fomet_api_client.dart';
import 'package:fomet_app/src/features/home/widgets/catalog/catalog_title.dart';
import 'package:fomet_app/src/features/home/widgets/catalog/inherited_catalog_state.dart';
import 'package:fomet_app/src/localization/localization.dart';
import 'package:fomet_app/src/utils/extensions.dart';
import 'package:fomet_app/src/utils/widgets/fomet_future_builder.dart';
import 'package:fomet_ui/fomet_ui.dart';

class VarietyView extends StatefulWidget {
  final PageController controller;
  const VarietyView({
    required this.controller,
    super.key,
  });

  @override
  State<VarietyView> createState() => _VarietyViewState();
}

class _VarietyViewState extends State<VarietyView> {
  late final future = FometVarietyClient(
    categoryCode: context.catalogState.category.code,
    languageCode: context.languageCode,
  ).execute();

  Future<void> onItemTap(FometCatalogItem item) async {
    context.catalogState.variety = item;
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
        CatalogHeader(
          title: context.l10n.variety,
          backButtonTap: () async => widget.controller.animateToPage(
            0,
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
