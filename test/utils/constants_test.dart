import 'package:flutter_test/flutter_test.dart';
import 'package:fomet_app/src/utils/constants.dart';
import 'package:fomet_ui/fomet_ui.dart';

void main() {
  group('Constants', () {
    test('Smoke test', () {
      expect(serviceInternalCode, equals('10'));
      expect(versionCheckerIconSize, equals(FometDimensions.space3x));
      expect(versionCheckerDialogIconSize, equals(FometDimensions.space6x));
    });
  });
}
