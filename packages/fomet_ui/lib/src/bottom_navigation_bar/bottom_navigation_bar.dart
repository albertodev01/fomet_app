import 'package:flutter/material.dart';
import 'package:fomet_ui/fomet_ui.dart';
import 'package:fomet_ui/src/bottom_navigation_bar/widget/bottom_navigation_item.dart';

/// A callback function used by [FometBottomNavigationBar] to indicate when the
/// user taps on a [FometNavigationBarItem].
typedef FometBottomNavigationBarItemChanged = void Function(int);

/// A bottom navigation bar component is generally placed at the bottom of a
/// [Scaffold] and is used for selecting among a small number of views.
///
/// The bottom navigation bar consists of multiple items in the form of text and
/// labels laid out on top of a colored container. This widget provides quick
/// navigation between the top-level views of the application.
///
/// For larger screens, prefer using [FometSideNavigationBar].
class FometBottomNavigationBar extends StatefulWidget {
  /// The items of the navigation bar.
  final List<FometNavigationBarItem> items;

  /// This callback is called when the user taps on an item that is not already
  /// selected.
  final FometBottomNavigationBarItemChanged onItemTap;

  /// The content above the navigation bar.
  final Widget child;

  /// An icon that is shown in the top-left corner of the page controlled by
  /// this navigation bar widget.
  final Widget topLeadingIcon;

  /// An icon that is shown in the top-right corner of the page controlled by
  /// this navigation bar widget.
  ///
  /// By default, this is set to `null`.
  final Widget? topTrailingIcon;

  /// The index of the currently visible page.
  ///
  /// This value changes whenever an item of [items] is tapped AND is not
  /// already selected.
  final ValueNotifier<int> selectedIndex;

  /// Creates a [FometBottomNavigationBar] widget.
  const FometBottomNavigationBar({
    required this.items,
    required this.onItemTap,
    required this.topLeadingIcon,
    required this.selectedIndex,
    required this.child,
    this.topTrailingIcon,
    super.key,
  });

  @override
  State<FometBottomNavigationBar> createState() =>
      _FometBottomNavigationBarState();
}

class _FometBottomNavigationBarState extends State<FometBottomNavigationBar> {
  /// This is to avoid unnecessary rebuilds of the navigation bar children.
  late List<Widget> children = generateChildren();

  /// Converts each [FometNavigationBarItem] into a tappable widget that will
  /// be placed in the bottom navigation container.
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

    // This is needed to trigger the "onItemTap" callback when the user taps an
    // item that is NOT selected.
    widget.selectedIndex.addListener(
      () => widget.onItemTap(widget.selectedIndex.value),
    );
  }

  @override
  void didUpdateWidget(covariant FometBottomNavigationBar oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Rebuilds the children list only when the parent configuration changes.
    if (widget.items != oldWidget.items) {
      children = generateChildren();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Top part with the icons
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: FometDimensions.space4x,
            vertical: FometDimensions.space1x,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              widget.topLeadingIcon,
              widget.topTrailingIcon ?? const SizedBox.shrink(),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: FometDimensions.space4x,
          ),
          child: Divider(height: 1),
        ),

        // Body
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: FometDimensions.space4x,
            ),
            child: widget.child,
          ),
        ),

        // Separates the content from the bar
        const Divider(height: 2),

        // The actual navigation bar
        Container(
          height: FometDimensions.large + MediaQuery.of(context).padding.bottom,
          decoration: const BoxDecoration(
            color: Color(0xFFF6F6F6),
          ),
          child: Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: FometDimensions.large,
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
