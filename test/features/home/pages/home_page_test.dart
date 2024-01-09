import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fomet_app/src/features/home/pages/home_page.dart';
import 'package:fomet_app/src/utils/widgets/centered_scrollable_content.dart';
import 'package:fomet_app/src/utils/widgets/logo_separator.dart';
import 'package:fomet_ui/fomet_ui.dart';

import '../../../mock_wrapper.dart';

void main() {
  group('HomePage', () {
    group('Widget tests', () {
      testWidgets('Smoke test', (tester) async {
        await tester.pumpWidget(
          const MockWrapper(
            child: HomePage(),
          ),
        );

        expect(find.byType(HomePage), findsOneWidget);
        expect(find.byType(LogoSeparator), findsOneWidget);
        expect(find.byType(FometButton), findsNWidgets(2));
        expect(find.byType(CenteredScrollableContent), findsOneWidget);
      });

      testWidgets('QR not supported on fuchsia', (tester) async {
        debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;

        await tester.pumpWidget(
          const MockWrapper(
            child: HomePage(),
          ),
        );

        expect(find.byType(HomePage), findsOneWidget);
        expect(find.byType(LogoSeparator), findsNothing);
        expect(find.byType(FometButton), findsOneWidget);

        debugDefaultTargetPlatformOverride = null;
      });
    });

    group('Golden tests', () {
      testWidgets('HomePage', (tester) async {
        await tester.pumpWidget(
          const MockWrapper(
            child: HomePage(),
          ),
        );

        await expectLater(
          find.byType(MockWrapper),
          matchesGoldenFile('goldens/home_page.png'),
        );
      });

      testWidgets('HomePage - no QR scan', (tester) async {
        debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;

        await tester.pumpWidget(
          const MockWrapper(
            child: HomePage(),
          ),
        );

        await expectLater(
          find.byType(MockWrapper),
          matchesGoldenFile('goldens/home_page_no_qr.png'),
        );

        debugDefaultTargetPlatformOverride = null;
      });
    });
  });
}
