import 'package:flutter/material.dart';
import 'package:fomet_app/src/features/home/widgets/catalog/catalog_title.dart';
import 'package:fomet_app/src/features/home/widgets/catalog/inherited_catalog_state.dart';
import 'package:fomet_app/src/localization/localization.dart';

class KindView extends StatelessWidget {
  final PageController controller;
  const KindView({
    required this.controller,
    super.key,
  });

  Future<void> _onItemTap(BuildContext context, String value) async {
    context.catalogState.kind = (code: value, description: 'Desc');
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
        CatalogHeader(
          title: context.l10n.kind,
          backButtonTap: () async => controller.animateToPage(
            1,
            duration: const Duration(milliseconds: 600),
            curve: Curves.linear,
          ),
        ),
        Expanded(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  onTap: () async => _onItemTap(context, '0'),
                  title: const Text('conventional'),
                  trailing: const Icon(Icons.chevron_right),
                ),
                ListTile(
                  onTap: () async => _onItemTap(context, '1'),
                  title: const Text('biologic'),
                ),
                ListTile(
                  onTap: () async => _onItemTap(context, '2'),
                  title: const Text('biodynamic'),
                  trailing: const Icon(Icons.chevron_right),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
