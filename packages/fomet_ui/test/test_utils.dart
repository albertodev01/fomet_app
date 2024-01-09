import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

/// Uses [tester] bindings to change the size of the test view.
Future<void> setSurfaceSize({
  required WidgetTester tester,
  required Size size,
}) async {
  await tester.binding.setSurfaceSize(size);
  addTearDown(() => tester.binding.setSurfaceSize(null));
}
