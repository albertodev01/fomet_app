import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fomet_app/src/utils/widgets/svg_asset_widgets.dart';

import '../../mock_wrapper.dart';
import '../../test_utils.dart';

void main() {
  group('SVG assets', () {
    group('Golden tests', () {
      testWidgets('LogoSvg', (tester) async {
        await setSurfaceSize(tester: tester, size: const Size(60, 60));

        await tester.pumpWidget(
          const MockWrapper(
            child: LogoSvg(),
          ),
        );

        await expectLater(
          find.byType(MockWrapper),
          matchesGoldenFile('goldens/svg_assets/logo_svg.png'),
        );
      });

      testWidgets('BannerLogoSvg', (tester) async {
        await setSurfaceSize(tester: tester, size: const Size(60, 60));

        await tester.pumpWidget(
          const MockWrapper(
            child: BannerLogoSvg(),
          ),
        );

        await expectLater(
          find.byType(MockWrapper),
          matchesGoldenFile('goldens/svg_assets/banner_logo_svg.png'),
        );
      });

      testWidgets('FactorySvg', (tester) async {
        await setSurfaceSize(tester: tester, size: const Size(60, 60));

        await tester.pumpWidget(
          const MockWrapper(
            child: FactorySvg(),
          ),
        );

        await expectLater(
          find.byType(MockWrapper),
          matchesGoldenFile('goldens/svg_assets/factory_svg.png'),
        );
      });

      testWidgets('MagnifyingGlassSvg', (tester) async {
        await setSurfaceSize(tester: tester, size: const Size(60, 60));

        await tester.pumpWidget(
          const MockWrapper(
            child: MagnifyingGlassSvg(),
          ),
        );

        await expectLater(
          find.byType(MockWrapper),
          matchesGoldenFile('goldens/svg_assets/magnifying_glass_svg.png'),
        );
      });

      testWidgets('TractorSvg', (tester) async {
        await setSurfaceSize(tester: tester, size: const Size(60, 60));

        await tester.pumpWidget(
          const MockWrapper(
            child: TractorSvg(),
          ),
        );

        await expectLater(
          find.byType(MockWrapper),
          matchesGoldenFile('goldens/svg_assets/tractor_svg.png'),
        );
      });

      testWidgets('FacebookSvg', (tester) async {
        await setSurfaceSize(tester: tester, size: const Size(60, 60));

        await tester.pumpWidget(
          const MockWrapper(
            child: FacebookSvg(),
          ),
        );

        await expectLater(
          find.byType(MockWrapper),
          matchesGoldenFile('goldens/svg_assets/facebook_svg.png'),
        );
      });

      testWidgets('InstagramSvg', (tester) async {
        await setSurfaceSize(tester: tester, size: const Size(60, 60));

        await tester.pumpWidget(
          const MockWrapper(
            child: InstagramSvg(),
          ),
        );

        await expectLater(
          find.byType(MockWrapper),
          matchesGoldenFile('goldens/svg_assets/instagram_svg.png'),
        );
      });

      testWidgets('LinkedinSvg', (tester) async {
        await setSurfaceSize(tester: tester, size: const Size(60, 60));

        await tester.pumpWidget(
          const MockWrapper(
            child: LinkedinSvg(),
          ),
        );

        await expectLater(
          find.byType(MockWrapper),
          matchesGoldenFile('goldens/svg_assets/linkedin_svg.png'),
        );
      });

      testWidgets('XSvg', (tester) async {
        await setSurfaceSize(tester: tester, size: const Size(60, 60));

        await tester.pumpWidget(
          const MockWrapper(
            child: XSvg(),
          ),
        );

        await expectLater(
          find.byType(MockWrapper),
          matchesGoldenFile('goldens/svg_assets/x_svg.png'),
        );
      });

      testWidgets('YouTubeSvg', (tester) async {
        await setSurfaceSize(tester: tester, size: const Size(60, 60));

        await tester.pumpWidget(
          const MockWrapper(
            child: YouTubeSvg(),
          ),
        );

        await expectLater(
          find.byType(MockWrapper),
          matchesGoldenFile('goldens/svg_assets/youtube_svg.png'),
        );
      });

      testWidgets('CatalogSvg', (tester) async {
        await setSurfaceSize(tester: tester, size: const Size(60, 60));

        await tester.pumpWidget(
          const MockWrapper(
            child: CatalogSvg(),
          ),
        );

        await expectLater(
          find.byType(MockWrapper),
          matchesGoldenFile('goldens/svg_assets/catalog_svg.png'),
        );
      });

      testWidgets('QRCodeSvg', (tester) async {
        await setSurfaceSize(tester: tester, size: const Size(60, 60));

        await tester.pumpWidget(
          const MockWrapper(
            child: QRCodeSvg(),
          ),
        );

        await expectLater(
          find.byType(MockWrapper),
          matchesGoldenFile('goldens/svg_assets/qr_code_svg.png'),
        );
      });
    });
  });
}
