import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fomet_ui/fomet_ui.dart';

void main() {
  group('FometTypography', () {
    test('Smoke test', () {
      expect(
        FometTypography.regular,
        equals(
          const TextStyle(
            fontFamily: 'Mukta',
            fontWeight: FontWeight.w400,
            color: FometColors.primaryText,
          ),
        ),
      );
      expect(
        FometTypography.bold,
        equals(
          const TextStyle(
            fontFamily: 'Mukta',
            fontWeight: FontWeight.w700,
            color: FometColors.primaryText,
          ),
        ),
      );
      expect(
        FometTypography.light,
        equals(
          const TextStyle(
            fontFamily: 'Mukta',
            fontWeight: FontWeight.w300,
            color: FometColors.primaryText,
          ),
        ),
      );
      expect(
        FometTypography.medium,
        equals(
          const TextStyle(
            fontFamily: 'Mukta',
            fontWeight: FontWeight.w500,
            color: FometColors.primaryText,
          ),
        ),
      );
      expect(
        FometTypography.semiBold,
        equals(
          const TextStyle(
            fontFamily: 'Mukta',
            fontWeight: FontWeight.w600,
            color: FometColors.primaryText,
          ),
        ),
      );
      expect(
        FometTypography.captionSmall,
        equals(
          const TextStyle(
            fontFamily: 'Mukta',
            fontWeight: FontWeight.w400,
            color: FometColors.inactiveText,
            fontSize: 12,
          ),
        ),
      );
    });
  });
}
