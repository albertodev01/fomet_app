import 'package:flutter/material.dart';
import 'package:fomet_app/src/features/home/widgets/catalog/catalog_progress.dart';
import 'package:fomet_app/src/features/home/widgets/catalog/inherited_catalog_state.dart';
import 'package:fomet_app/src/features/home/widgets/catalog/views/category_view.dart';
import 'package:fomet_app/src/features/home/widgets/catalog/views/kind_view.dart';
import 'package:fomet_app/src/features/home/widgets/catalog/views/products_details_view.dart';
import 'package:fomet_app/src/features/home/widgets/catalog/views/products_view.dart';
import 'package:fomet_app/src/features/home/widgets/catalog/views/variety_view.dart';
import 'package:fomet_app/src/utils/widgets/shell_page_wrapper.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  final controller = PageController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    context.catalogState.clear();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ShellPageWrapper(
      child: Column(
        children: [
          // Contents
          Expanded(
            child: PageView(
              controller: controller,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                CategoryView(controller: controller),
                VarietyView(controller: controller),
                KindView(controller: controller),
                ProductsView(controller: controller),
                ProductsDetailsView(controller: controller),
              ],
            ),
          ),

          const Divider(),

          // Progress indicator
          const CatalogProgress(),
        ],
      ),
    );
  }
}
