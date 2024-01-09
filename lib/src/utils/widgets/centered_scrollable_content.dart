import 'package:flutter/material.dart';

/// Lays [children] at the center of the screen and scrolls when needed.
class CenteredScrollableContent extends StatelessWidget {
  /// The children that are displayed at the center of the screen.
  final List<Widget> children;

  /// Creates a [CenteredScrollableContent] widget.
  const CenteredScrollableContent({
    required this.children,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // We're using 'SliverFillRemaining' because it makes the contents
    // fill the entire viewport and, on desktop or web, the scroll bar
    // appears on the right edge of the window (while the contents ALWAYS
    // stay at the center).
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: children,
            ),
          ),
        ),
      ],
    );
  }
}
