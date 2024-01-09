import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fomet_app/src/features/about/pages/about_page.dart';
import 'package:fomet_app/src/features/about/widgets/social_links.dart';
import 'package:fomet_app/src/utils/widgets/svg_asset_widgets.dart';

import '../../../mock_wrapper.dart';
import '../../../test_utils.dart';

void main() {
  group('AboutPage', () {
    group('Widget tests', () {
      testWidgets('Smoke test', (tester) async {
        await setSurfaceSize(tester: tester, size: const Size(1000, 1200));

        await tester.pumpWidget(
          const MockWrapper(
            child: AboutPage(),
          ),
        );

        expect(find.byType(AboutPage), findsOneWidget);

        // Images
        expect(find.byType(BannerLogoSvg), findsOneWidget);
        expect(find.byType(TractorSvg), findsOneWidget);
        expect(find.byType(FactorySvg), findsOneWidget);
        expect(find.byType(MagnifyingGlassSvg), findsOneWidget);

        await tester.scrollUntilVisible(find.byType(SocialLinks), 200);
        expect(find.byType(SocialLinks), findsOneWidget);
      });
    });

    group('Golden tests', () {
      testWidgets('AboutPage', (tester) async {
        await setSurfaceSize(tester: tester, size: const Size(1000, 1200));

        await tester.pumpWidget(
          const MockWrapper(
            child: AboutPage(),
          ),
        );

        await expectLater(
          find.byType(MockWrapper),
          matchesGoldenFile('goldens/about_page.png'),
        );
      });

      testWidgets('AboutPage - social links', (tester) async {
        await tester.pumpWidget(
          const MockWrapper(
            child: AboutPage(),
          ),
        );

        await tester.scrollUntilVisible(
          find.byType(SocialLinks),
          200,
        );

        await expectLater(
          find.byType(MockWrapper),
          matchesGoldenFile('goldens/about_page_social_links.png'),
        );
      });
    });
  });
}
