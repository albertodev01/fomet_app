import 'package:flutter_test/flutter_test.dart';
import 'package:fomet_ui/fomet_ui.dart';

void main() {
  group('Constants', () {
    test('Smoke test', () {
      expect(
        scaffoldDesktopBreakpoint,
        equals(880.0),
      );
    });
  });
}
