import 'dart:io';

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

/// Loads a PNG asset from the `test/assets` folder.
Future<Uint8List> loadImageAsset({
  required WidgetTester tester,
  required String imageName,
}) async {
  final file = File('test/assets/$imageName.png');
  final bytes = await tester.runAsync<Uint8List>(file.readAsBytes);
  return bytes!;
}
