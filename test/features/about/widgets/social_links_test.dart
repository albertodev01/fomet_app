import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fomet_app/src/features/about/widgets/social_links.dart';
import 'package:fomet_app/src/utils/widgets/svg_asset_widgets.dart';

import '../../../mock_wrapper.dart';

void main() {
  group('SocialLinks', () {
    var urlLaunchArgument = '';

    setUpAll(() {
      final testBinding = TestDefaultBinaryMessengerBinding.instance;
      testBinding.defaultBinaryMessenger.setMockMethodCallHandler(
        const MethodChannel('plugins.flutter.io/url_launcher'),
        (message) async {
          final map = message.arguments as Map<Object?, Object?>;
          urlLaunchArgument = map['url']! as String;
          return true;
        },
      );
    });

    tearDown(() => urlLaunchArgument = '');

    group('Widget tests', () {
      testWidgets('Smoke test', (tester) async {
        await tester.pumpWidget(
          const MockWrapper(
            child: SocialLinks(),
          ),
        );

        expect(find.byType(SocialLinks), findsOneWidget);
        expect(find.byType(Wrap), findsOneWidget);
        expect(find.byType(XSvg), findsOneWidget);
        expect(find.byType(InstagramSvg), findsOneWidget);
        expect(find.byType(FacebookSvg), findsOneWidget);
        expect(find.byType(YouTubeSvg), findsOneWidget);
        expect(find.byType(LinkedinSvg), findsOneWidget);
      });

      testWidgets('X link', (tester) async {
        await tester.pumpWidget(
          const MockWrapper(
            child: SocialLinks(),
          ),
        );

        await tester.tap(find.byType(XSvg));
        expect(urlLaunchArgument, equals('https://x.com/fometfert'));
      });

      testWidgets('Instagram link', (tester) async {
        await tester.pumpWidget(
          const MockWrapper(
            child: SocialLinks(),
          ),
        );

        await tester.tap(find.byType(InstagramSvg));
        expect(urlLaunchArgument, equals('https://www.instagram.com/fometspa'));
      });

      testWidgets('Facebook link', (tester) async {
        await tester.pumpWidget(
          const MockWrapper(
            child: SocialLinks(),
          ),
        );

        await tester.tap(find.byType(FacebookSvg));
        expect(urlLaunchArgument, equals('https://www.facebook.com/FometSpa/'));
      });

      testWidgets('YouTube link', (tester) async {
        await tester.pumpWidget(
          const MockWrapper(
            child: SocialLinks(),
          ),
        );

        await tester.tap(find.byType(YouTubeSvg));
        expect(
          urlLaunchArgument,
          equals('https://www.youtube.com/channel/UCFK4hFf4p0EL_SMT0mA2rSw'),
        );
      });

      testWidgets('Linkedin link', (tester) async {
        await tester.pumpWidget(
          const MockWrapper(
            child: SocialLinks(),
          ),
        );

        await tester.tap(find.byType(LinkedinSvg));
        expect(
          urlLaunchArgument,
          equals('https://www.linkedin.com/company/fomet-spa'),
        );
      });
    });

    group('Golden tests', () {
      testWidgets('SocialLinks', (tester) async {
        await tester.pumpWidget(
          const MockWrapper(
            child: SocialLinks(),
          ),
        );

        await expectLater(
          find.byType(MockWrapper),
          matchesGoldenFile('goldens/social_links.png'),
        );
      });
    });
  });
}
