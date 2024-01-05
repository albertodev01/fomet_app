import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fomet_app/src/utils/widgets/logo_separator.dart';
import 'package:fomet_app/src/utils/widgets/svg_asset_widgets.dart';

import '../../mock_wrapper.dart';

void main() {
  group('LogoSeparator', () {
    group('Widget tests', () {
      testWidgets('Smoke test', (tester) async {
        await tester.pumpWidget(
          const MockWrapper(
            child: LogoSeparator(),
          ),
        );

        expect(find.byType(LogoSeparator), findsOneWidget);
        expect(find.byType(LogoSvg), findsOneWidget);
        expect(find.byType(Divider), findsNWidgets(2));
      });
    });

    group('Golden tests', () {
      testWidgets('LogoSeparator', (tester) async {
        await tester.pumpWidget(
          const MockWrapper(
            child: LogoSeparator(),
          ),
        );

        await expectLater(
          find.byType(MockWrapper),
          matchesGoldenFile('goldens/logo_separator.png'),
        );
      });
    });
  });
}
