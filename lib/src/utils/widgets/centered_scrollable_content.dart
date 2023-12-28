import 'package:flutter/material.dart';

class CenteredScrollableContent extends StatelessWidget {
  final bool hasScrollBody;
  final List<Widget> children;
  const CenteredScrollableContent({
    required this.children,
    this.hasScrollBody = false,
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
          hasScrollBody: hasScrollBody,
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
