import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fomet_ui/fomet_ui.dart';

void main() {
  group('FometColors', () {
    test('Smoke test', () {
      expect(
        FometColors.primary,
        equals(const Color(0xFF95C01E)),
      );
      expect(
        FometColors.secondary,
        equals(const Color(0xFFD21120)),
      );
      expect(
        FometColors.primaryHovered,
        equals(const Color(0xFFB6ED37)),
      );
      expect(
        FometColors.secondaryHovered,
        equals(const Color(0xFFF04A57)),
      );
      expect(
        FometColors.primaryText,
        equals(const Color(0xFF000000)),
      );
      expect(
        FometColors.secondaryText,
        equals(const Color(0xFF633B1A)),
      );
      expect(
        FometColors.inactiveText,
        equals(const Color(0xFF9E9E9E)),
      );
    });
  });
}
