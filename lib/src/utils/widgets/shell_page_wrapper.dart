import 'package:flutter/material.dart';

class ShellPageWrapper extends StatelessWidget {
  final Widget child;
  const ShellPageWrapper({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: child,
    );
  }
}
