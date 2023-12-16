import 'package:flutter/material.dart';
import 'package:fomet_app/src/localization/localization.dart';
import 'package:fomet_app/src/routing/route_names.dart';
import 'package:fomet_app/src/utils/constants.dart';
import 'package:fomet_ui/fomet_ui.dart';
import 'package:go_router/go_router.dart';

/// A wrapper of [Scaffold] that should be used when no navigation bars are
/// needed.
class FometPageScaffold extends StatefulWidget {
  /// The page content.
  final Widget child;

  /// Creates a [FometPageScaffold] widget.
  const FometPageScaffold({
    required this.child,
    super.key,
  });

  @override
  State<FometPageScaffold> createState() => _FometPageScaffoldState();
}

class _FometPageScaffoldState extends State<FometPageScaffold> {
  late final items = [
    (iconData: Icons.home, text: context.l10n.home),
    (iconData: Icons.energy_savings_leaf, text: context.l10n.products),
    (iconData: Icons.question_answer, text: context.l10n.faq),
    (iconData: Icons.info_outlined, text: context.l10n.about),
  ];

  /// Caches a [FometBottomNavigationBar] widget so that its state is not lost
  /// when removed from the tree.
  late final bottomNavigationBar = FometBottomNavigationBar(
    onItemTap: mapIndexToPath,
    items: items,
  );

  /// Caches a [FometSideNavigationBar] widget so that its state is not lost
  /// when removed from the tree.
  late FometSideNavigationBar sideNavigationBar = FometSideNavigationBar(
    onItemTap: mapIndexToPath,
    items: items,
    child: widget.child,
  );

  /// Navigates to a certain destionation based on [index].
  void mapIndexToPath(int index) {
    final path = switch (index) {
      0 => homePagePath,
      1 => productsPagePath,
      2 => faqPagePath,
      _ => aboutPagePath,
    };

    context.go(path);
  }

  @override
  void didUpdateWidget(covariant FometPageScaffold oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.child != oldWidget.child) {
      sideNavigationBar = FometSideNavigationBar(
        onItemTap: mapIndexToPath,
        items: items,
        child: widget.child,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, dimensions) {
          if (dimensions.maxWidth >= scaffoldDesktopBreakpoint) {
            return sideNavigationBar;
          }

          return widget.child;
        },
      ),
      bottomNavigationBar: LayoutBuilder(
        builder: (context, dimensions) {
          if (dimensions.maxWidth < scaffoldDesktopBreakpoint) {
            return bottomNavigationBar;
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
