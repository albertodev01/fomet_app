import 'package:flutter/material.dart';
import 'package:fomet_ui/fomet_ui.dart';
import 'package:fomet_ui/src/bottom_navigation_bar/widget/bottom_navigation_item.dart';

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

  final Widget child;

  final Widget header;

  final ValueNotifier<int> selectedIndex;

  /// Creates a [FometBottomNavigationBar] widget.
  const FometBottomNavigationBar({
    required this.items,
    required this.onItemTap,
    required this.header,
    required this.selectedIndex,
    required this.child,
    super.key,
  });

  @override
  State<FometBottomNavigationBar> createState() =>
      _FometBottomNavigationBarState();
}

class _FometBottomNavigationBarState extends State<FometBottomNavigationBar> {
  late List<Widget> children = generateChildren();

  List<Widget> generateChildren() {
    return List<Widget>.generate(
      widget.items.length,
      growable: false,
      (index) {
        final element = widget.items[index];

        return Expanded(
          child: GestureDetector(
            onTap: () => widget.selectedIndex.value = index,
            child: Center(
              child: BottomNavigationItem(
                selectedIndex: widget.selectedIndex,
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

    widget.selectedIndex.addListener(
      () => widget.onItemTap(widget.selectedIndex.value),
    );
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
        // Top part
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 32,
            vertical: 8,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              widget.header,
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.device_hub,
                ),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 32,
          ),
          child: Divider(
            height: 1,
          ),
        ),

        // Body
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: widget.child,
          ),
        ),

        // Separates the content from the bar
        const Divider(
          height: 2,
        ),

        // The actual navigation bar
        Container(
          height: 64 + MediaQuery.of(context).padding.bottom,
          decoration: const BoxDecoration(
            color: Color(0xFFF6F6F6),
          ),
          child: Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: 64,
              child: Row(
                children: children,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
