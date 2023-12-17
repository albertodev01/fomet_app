import 'package:flutter/material.dart';
import 'package:fomet_ui/fomet_ui.dart';
import 'package:fomet_ui/src/side_navigation_bar/widget/side_navigation_item.dart';

/// A callback function used by [FometSideNavigationBar] to indicate when the
/// user taps on a [FometNavigationBarItem].
typedef FometSideNavigationBarItemChanged = void Function(int);

/// A side navigation bar component is generally placed on the left side of a
/// [Scaffold] and is used for selecting form a number of entries.
class FometSideNavigationBar extends StatefulWidget {
  /// The items of the navigation bar.
  final List<FometNavigationBarItem> items;

  /// This callback is called when the user taps on an item that is not already
  /// selected.
  final FometSideNavigationBarItemChanged onItemTap;

  final Widget header;

  final Widget child;

  final ValueNotifier<int> selectedIndex;

  /// Creates a [FometSideNavigationBar] widget.
  const FometSideNavigationBar({
    required this.items,
    required this.onItemTap,
    required this.header,
    required this.child,
    required this.selectedIndex,
    super.key,
  });

  @override
  State<FometSideNavigationBar> createState() => _FometSideNavigationBarState();
}

class _FometSideNavigationBarState extends State<FometSideNavigationBar> {
  late var children = generateChildren();

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

    widget.selectedIndex.addListener(
      () => widget.onItemTap(widget.selectedIndex.value),
    );
  }

  @override
  void didUpdateWidget(covariant FometSideNavigationBar oldWidget) {
    super.didUpdateWidget(oldWidget);

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
              width: 256,
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 36),
                        child: widget.header,
                      ),
                      ...children,
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: widget.child,
            ),
            const SizedBox(width: 8),
          ],
        ),
      ),
    );
  }
}
