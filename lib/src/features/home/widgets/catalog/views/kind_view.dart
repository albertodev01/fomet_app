import 'package:flutter/material.dart';
import 'package:fomet_app/src/features/home/widgets/catalog/catalog_title.dart';
import 'package:fomet_app/src/localization/localization.dart';

class KindView extends StatefulWidget {
  final PageController controller;
  const KindView({
    required this.controller,
    super.key,
  });

  @override
  State<KindView> createState() => _KindViewState();
}

class _KindViewState extends State<KindView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CatalogHeader(
          title: context.l10n.kind,
          backButtonTap: () async => widget.controller.animateToPage(
            1,
            duration: const Duration(milliseconds: 600),
            curve: Curves.linear,
          ),
        ),
        const Expanded(
          child: Center(
            child: Text('hi'),
          ),
        ),
      ],
    );
  }
}
