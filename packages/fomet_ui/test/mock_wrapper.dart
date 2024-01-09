import 'package:flutter/material.dart';

/// A wrapper of a [MaterialApp] with localization support to be used in widget
/// tests.
class MockWrapper extends StatelessWidget {
  /// The child to be tested.
  final Widget child;

  /// Creates a [MockWrapper] widget.
  const MockWrapper({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Mukta',
      ),
      home: Scaffold(
        body: child,
      ),
    );
  }
}
