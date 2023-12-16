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

  final Widget child;

  /// Creates a [FometSideNavigationBar] widget.
  const FometSideNavigationBar({
    required this.items,
    required this.onItemTap,
    required this.child,
    super.key,
  });

  @override
  State<FometSideNavigationBar> createState() => _FometSideNavigationBarState();
}

class _FometSideNavigationBarState extends State<FometSideNavigationBar> {
  /// Keeps track of the currently selected page index.
  final selectedIndex = ValueNotifier<int>(0);

  late var children = generateChildren();

  List<Widget> generateChildren() {
    return List<Widget>.generate(
      widget.items.length,
      growable: false,
      (index) {
        final element = widget.items[index];

        return GestureDetector(
          onTap: () => selectedIndex.value = index,
          child: SideNavigationItem(
            selectedIndex: selectedIndex,
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

    selectedIndex.addListener(() => widget.onItemTap(selectedIndex.value));
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
    return Row(
      children: [
        // The actual navigation bar
        Container(
          width: 256,
          decoration: const BoxDecoration(
            color: Color(0xFFF6F6F6),
          ),
          child: ListView(
            children: children,
          ),
        ),

        // Separates the content from the bar
        const VerticalDivider(
          width: 2,
        ),

        Expanded(
          child: widget.child,
        ),
      ],
    );
  }
}
