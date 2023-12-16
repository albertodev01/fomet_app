import 'package:flutter/material.dart';
import 'package:fomet_ui/fomet_ui.dart';
import 'package:fomet_ui/src/bottom_navigation_bar/widget/bottom_navigation_item.dart';
import 'package:fomet_ui/src/side_navigation_bar/widget/side_navigation_item.dart';

/// A callback function used by [FometBottomNavigationBar] to indicate when the
/// user taps on a [FometNavigationBarItem].
typedef FometBottomNavigationBarItemChanged = void Function(int);

/// A bottom navigation bar component is generally placed at the bottom of a
/// [Scaffold] and is used for selecting among a small number of views.
///
/// Generally,
class FometBottomNavigationBar extends StatefulWidget {
  /// The items of the navigation bar.
  final List<FometNavigationBarItem> items;

  /// This callback is called when the user taps on an item that is not already
  /// selected.
  final FometBottomNavigationBarItemChanged onItemTap;

  /// Creates a [FometBottomNavigationBar] widget.
  const FometBottomNavigationBar({
    required this.items,
    required this.onItemTap,
    super.key,
  });

  @override
  State<FometBottomNavigationBar> createState() =>
      _FometBottomNavigationBarState();
}

class _FometBottomNavigationBarState extends State<FometBottomNavigationBar> {
  /// Keeps track of the currently selected page index.
  final selectedIndex = ValueNotifier<int>(0);

  late var children = generateChildren();

  List<Widget> generateChildren() {
    return List<Widget>.generate(
      widget.items.length,
      growable: false,
      (index) {
        final element = widget.items[index];

        return Expanded(
          child: GestureDetector(
            onTap: () => selectedIndex.value = index,
            child: Center(
              child: BottomNavigationItem(
                selectedIndex: selectedIndex,
                index: index,
                text: element.text,
                iconData: element.iconData,
              ),
            ),
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
  void didUpdateWidget(covariant FometBottomNavigationBar oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.items != oldWidget.items) {
      children = generateChildren();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Separates the content from the bar
        const Divider(
          height: 2,
        ),

        // The actual navigation bar
        Container(
          height: 62,
          decoration: const BoxDecoration(
            color: Color(0xFFF6F6F6),
          ),
          child: Row(
            children: children,
          ),
        ),
      ],
    );
  }
}
