import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// This widget is the first child of a [GoRoute] that is inside a [ShellRoute].
/// For example:
///
/// ```dart
/// ShellRoute(
///   navigatorKey: _key,
///   builder: (_, __, child) => MyScaffold(child: child),
///   routes: [
///     GoRoute(
///       path: pathA,
///       parentNavigatorKey: _key,
///       builder: (_, __) => const ShellPageWrapper(child: PageA()),
///     ),
///     GoRoute(
///       path: pathB,
///       parentNavigatorKey: _key,
///       builder: (_, __) => const ShellPageWrapper(child: PageB()),
///     ),
///   ],
/// ),
/// ```
class ShellPageWrapper extends StatelessWidget {
  /// The page inside the route of a [ShellRoute].
  final Widget child;

  /// Creates a [ShellPageWrapper] widget.
  const ShellPageWrapper({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: child,
    );
  }
}
