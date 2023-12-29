import 'package:flutter/material.dart';
import 'package:fomet_api_client/fomet_api_client.dart';
import 'package:fomet_app/src/features/home/widgets/catalog/inherited_catalog_state.dart';
import 'package:fomet_app/src/features/home/widgets/catalog/section_header.dart';
import 'package:fomet_app/src/localization/localization.dart';
import 'package:fomet_app/src/utils/extensions.dart';
import 'package:fomet_app/src/utils/widgets/fomet_future_builder.dart';
import 'package:fomet_ui/fomet_ui.dart';

class CategoryView extends StatefulWidget {
  final PageController controller;
  const CategoryView({
    required this.controller,
    super.key,
  });

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  late final future = FometCategoryClient(
    languageCode: context.languageCode,
  ).execute();

  Future<void> onItemTap(FometCatalogItem item) async {
    context.catalogState.category = item;
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
