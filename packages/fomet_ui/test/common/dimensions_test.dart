import 'package:flutter_test/flutter_test.dart';
import 'package:fomet_ui/fomet_ui.dart';

void main() {
  group('FometDimensions', () {
    test('Smoke test', () {
      expect(
        FometDimensions.space1x,
        equals(8.0),
      );
      expect(
        FometDimensions.space2x,
        equals(16.0),
      );
      expect(
        FometDimensions.space3x,
        equals(24.0),
      );
      expect(
        FometDimensions.space4x,
        equals(32.0),
      );
      expect(
        FometDimensions.space5x,
        equals(40.0),
      );
      expect(
        FometDimensions.space6x,
        equals(48.0),
      );
      expect(
        FometDimensions.small,
        equals(12.0),
      );
      expect(
        FometDimensions.medium,
        equals(36.0),
      );
      expect(
        FometDimensions.large,
        equals(64.0),
      );
      expect(
        FometDimensions.extraLarge,
        equals(72.0),
      );
    });
  });
}
