import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

/// This file is executed before any test in a Flutter application. We use this
/// to make sure that golden tests use a font with meaningful characters.
Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  // This is needed to load a human-readable font for golden tests rather than
  // using the default one.
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();

    final font = rootBundle.load('fonts/Mukta-Regular.ttf');
    final fontLoader = FontLoader('Mukta')..addFont(font);

    await fontLoader.load();
  });

  return testMain();
}
