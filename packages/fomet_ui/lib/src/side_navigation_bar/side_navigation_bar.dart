import 'package:flutter/material.dart';
import 'package:fomet_ui/fomet_ui.dart';
import 'package:fomet_ui/src/common/tokens.dart';
import 'package:fomet_ui/src/side_navigation_bar/widget/side_navigation_item.dart';

/// A callback function used by [FometSideNavigationBar] to indicate when the
/// user taps on a [FometNavigationBarItem].
typedef FometSideNavigationBarItemChanged = void Function(int);

/// A side navigation bar component is generally placed to the left side of the
/// page and is used for selecting between a series of options.
///
/// The side navigation bar consists of multiple items in the form of text and
/// labels enclosed by a container with animated borders. This widget provides
/// quick navigation between the top-level views of the application.
///
/// For smaller screens, prefer using [FometBottomNavigationBar].
class FometSideNavigationBar extends StatefulWidget {
  /// The items of the navigation bar.
  final List<FometNavigationBarItem> items;

  /// This callback is called when the user taps on an item that is not already
  /// selected.
  final FometSideNavigationBarItemChanged onItemTap;

  /// An icon that is shown above all [items] widgets.
  final Widget sidebarLeadingIcon;

  /// An icon that is shown below all [items] widgets.
  ///
  /// By default, this is set to `null`.
  final Widget? sidebarTrailingIcon;

  /// The content next to the navigation bar.
  final Widget child;

  /// The index of the currently visible page.
  ///
  /// This value changes whenever an item of [items] is tapped AND is not
  /// already selected.
  final ValueNotifier<int> selectedIndex;

  /// Creates a [FometSideNavigationBar] widget.
  const FometSideNavigationBar({
    required this.items,
    required this.onItemTap,
    required this.sidebarLeadingIcon,
    required this.child,
    required this.selectedIndex,
    this.sidebarTrailingIcon,
    super.key,
  });

  @override
  State<FometSideNavigationBar> createState() => _FometSideNavigationBarState();
}

class _FometSideNavigationBarState extends State<FometSideNavigationBar> {
  /// This is to avoid unnecessary rebuilds of the navigation bar children.
  late List<Widget> children = generateChildren();

  /// Converts each [FometNavigationBarItem] into a tappable widget that will
  /// be placed in the side navigation container.
  List<Widget> generateChildren() {
    return List<Widget>.generate(
      widget.items.length,
      growable: false,
      (index) {
        final element = widget.items[index];
        return GestureDetector(
          onTap: () => widget.selectedIndex.value = index,
          child: SideNavigationItem(
            selectedIndex: widget.selectedIndex,
            index: index,
            text: element.text,
            iconData: element.iconData,
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();

    // This is needed to trigger the "onItemTap" callback when the user taps an
    // item that is NOT selected.
    widget.selectedIndex.addListener(
      () => widget.onItemTap(widget.selectedIndex.value),
    );
  }

  @override
  void didUpdateWidget(covariant FometSideNavigationBar oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Rebuilds the children list only when the parent configuration changes.
    if (widget.items != oldWidget.items) {
      children = generateChildren();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minWidth: scaffoldDesktopBreakpoint,
          maxWidth: scaffoldDesktopBreakpoint,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // The actual navigation bar
            SizedBox(
              width: FometSideNavigationTokens.sideBarWidth,
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: FometDimensions.space4x,
                        ),
                        child: widget.sidebarLeadingIcon,
                      ),
                      ...children,
                      if (widget.sidebarTrailingIcon != null)
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: FometDimensions.space2x,
                          ),
                          child: widget.sidebarTrailingIcon,
                        ),
                    ],
                  ),
                ),
              ),
            ),

            // Space
            const SizedBox(
              width: FometDimensions.space3x,
            ),

            // The body
            Expanded(
              child: widget.child,
            ),

            // Other trailing space
            const SizedBox(
              width: FometDimensions.space1x,
            ),
          ],
        ),
      ),
    );
  }
}
