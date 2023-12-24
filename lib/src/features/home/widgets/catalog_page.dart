import 'package:flutter/material.dart';
import 'package:fomet_app/src/features/home/widgets/catalog/catalog_progress.dart';
import 'package:fomet_app/src/features/home/widgets/catalog/views/category_view.dart';
import 'package:fomet_app/src/features/home/widgets/catalog/views/kind_view.dart';
import 'package:fomet_app/src/features/home/widgets/catalog/views/variety_view.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  final controller = PageController();

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
          child: PageView(
            controller: controller,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              CategoryView(controller: controller),
              VarietyView(controller: controller),
              KindView(controller: controller),
            ],
          ),
        ),

        const Divider(),

        // Progress indicator
        const CatalogProgress(),
      ],
    );
  }
}
