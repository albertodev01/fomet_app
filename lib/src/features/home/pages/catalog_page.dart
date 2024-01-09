import 'package:flutter/material.dart';
import 'package:fomet_app/src/features/home/widgets/catalog/catalog_progress.dart';
import 'package:fomet_app/src/features/home/widgets/catalog/views/category_view.dart';
import 'package:fomet_app/src/features/home/widgets/catalog/views/kind_view.dart';
import 'package:fomet_app/src/features/home/widgets/catalog/views/products_details_view.dart';
import 'package:fomet_app/src/features/home/widgets/catalog/views/products_view.dart';
import 'package:fomet_app/src/features/home/widgets/catalog/views/variety_view.dart';
import 'package:fomet_app/src/utils/widgets/inherited_object.dart';

/// The catalog page can be opened from the home page. It guides the user
/// through the selection of a series of options to find a specifc product.
class CatalogPage extends StatefulWidget {
  /// Creates a [CatalogPage] widget.
  const CatalogPage({super.key});

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  /// A controller that allows changing [PageView] children programmatically.
  final controller = PageController();

  /// A cached list of children of [PageView].
  late final pageViewChildren = [
    CategoryView(controller: controller),
    VarietyView(controller: controller),
    KindView(controller: controller),
    ProductsView(controller: controller),
    ProductsDetailsView(controller: controller),
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Ensure that no previous state exists.
    context.catalogState.clear();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Contents
        Expanded(
          child: PageView.builder(
            controller: controller,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: pageViewChildren.length,
            itemBuilder: (_, index) => pageViewChildren[index],
          ),
        ),

        // Separator
        const Divider(),

        // Progress indicator
        const CatalogProgress(),
      ],
    );
  }
}
