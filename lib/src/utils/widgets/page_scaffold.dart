import 'package:flutter/material.dart';
import 'package:fomet_api_client/fomet_api_client.dart';
import 'package:fomet_app/src/localization/localization.dart';
import 'package:fomet_app/src/routing/route_names.dart';
import 'package:fomet_app/src/utils/constants.dart';
import 'package:fomet_app/src/utils/widgets/svg_asset_widgets.dart';
import 'package:fomet_app/src/utils/widgets/version_code_checker.dart';
import 'package:fomet_ui/fomet_ui.dart';
import 'package:go_router/go_router.dart';

/// A wrapper of [Scaffold] that should be used when no navigation bars are
/// needed.
class FometPageScaffold extends StatefulWidget {
  /// The page content.
  final Widget child;

  /// {@template fomet_app.pages.mockClient}
  /// A mock implementation of an HTTP client that allows overriding the default
  /// behavior of a client. This is often useful in tests.
  ///
  /// By default, this is set to `null`.
  /// {@endtemplate}
  final FometMockClient? mockClient;

  /// Creates a [FometPageScaffold] widget.
  const FometPageScaffold({
    required this.child,
    this.mockClient,
    super.key,
  });

  @override
  State<FometPageScaffold> createState() => _FometPageScaffoldState();
}

class _FometPageScaffoldState extends State<FometPageScaffold> {
  /// Children of the navigation bar.
  late final items = [
    (iconData: Icons.home, text: context.l10n.home),
    (iconData: Icons.energy_savings_leaf, text: context.l10n.products),
    (iconData: Icons.question_answer, text: context.l10n.faq),
    (iconData: Icons.info_outlined, text: context.l10n.about),
  ];

  /// Checks whether the application is updated or not.
  late final isUpdated = FometAppVersionClient(
    currentVersionCode: serviceInternalCode,
    client: widget.mockClient,
  ).execute();

  /// The index of the currently selected item.
  final selectedIndex = ValueNotifier<int>(0);

  /// Caches a [FometBottomNavigationBar] widget so that its state is not lost
  /// when removed from the tree.
  late FometBottomNavigationBar bottomNavigationBar = FometBottomNavigationBar(
    onItemTap: mapIndexToPath,
    items: items,
    topLeadingIcon: const LogoSvg(
      width: 24,
      height: 24,
    ),
    selectedIndex: selectedIndex,
    topTrailingIcon: VersionCodeChecker(
      isUpdated: isUpdated,
    ),
    child: widget.child,
  );

  /// Caches a [FometSideNavigationBar] widget so that its state is not lost
  /// when removed from the tree.
  late FometSideNavigationBar sideNavigationBar = FometSideNavigationBar(
    onItemTap: mapIndexToPath,
    items: items,
    sidebarLeadingIcon: const LogoSvg(
      width: 64,
      height: 64,
    ),
    selectedIndex: selectedIndex,
    sidebarTrailingIcon: VersionCodeChecker(
      isUpdated: isUpdated,
    ),
    child: widget.child,
  );

  /// Navigates to a certain destionation based on [index].
  void mapIndexToPath(int index) => context.go(
        switch (index) {
          0 => homePagePath,
          1 => productsPagePath,
          2 => faqPagePath,
          _ => aboutPagePath,
        },
      );

  @override
  void didUpdateWidget(covariant FometPageScaffold oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.child != oldWidget.child) {
      sideNavigationBar = FometSideNavigationBar(
        onItemTap: mapIndexToPath,
        items: items,
        selectedIndex: selectedIndex,
        sidebarLeadingIcon: const LogoSvg(
          width: 64,
          height: 64,
        ),
        sidebarTrailingIcon: VersionCodeChecker(
          isUpdated: isUpdated,
        ),
        child: widget.child,
      );
      bottomNavigationBar = FometBottomNavigationBar(
        onItemTap: mapIndexToPath,
        items: items,
        selectedIndex: selectedIndex,
        topLeadingIcon: const LogoSvg(
          width: 24,
          height: 24,
        ),
        topTrailingIcon: VersionCodeChecker(
          isUpdated: isUpdated,
        ),
        child: widget.child,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final safeSpaces = MediaQuery.of(context).padding;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: safeSpaces.top,
        ),
        child: LayoutBuilder(
          builder: (context, dimensions) {
            if (dimensions.maxWidth >= scaffoldDesktopBreakpoint) {
              return sideNavigationBar;
            }

            return bottomNavigationBar;
          },
        ),
      ),
    );
  }
}
