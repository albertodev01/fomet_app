import 'package:flutter_test/flutter_test.dart';
import 'package:fomet_app/src/features/home/pages/home_page.dart';
import 'package:fomet_app/src/routing/route_names.dart';
import 'package:fomet_app/src/utils/widgets/centered_scrollable_content.dart';
import 'package:fomet_app/src/utils/widgets/error_page.dart';
import 'package:fomet_app/src/utils/widgets/svg_asset_widgets.dart';
import 'package:fomet_ui/fomet_ui.dart';

import '../../mock_wrapper.dart';

void main() {
  group('ErrorPage', () {
    group('Widget tests', () {
      testWidgets('Smoke test', (tester) async {
        await tester.pumpWidget(
          const MockWrapper(
            child: ErrorPage(),
          ),
        );

        expect(find.byType(ErrorPage), findsOneWidget);
        expect(find.byType(CenteredScrollableContent), findsOneWidget);
        expect(find.byType(LogoSvg), findsOneWidget);
        expect(find.byType(FometButton), findsOneWidget);
      });

      testWidgets('Redirect to home page', (tester) async {
        await tester.pumpWidget(
          const MockWrapperWithNavigator(
            initialRoute: errorPagePath,
          ),
        );

        expect(find.byType(ErrorPage), findsOneWidget);
        expect(find.byType(HomePage), findsNothing);

        await tester.tap(find.byType(FometButton));
        await tester.pumpAndSettle();

        expect(find.byType(ErrorPage), findsNothing);
        expect(find.byType(HomePage), findsOneWidget);
      });
    });

    group('Golden tests', () {
      testWidgets('Error page', (tester) async {
        await tester.pumpWidget(
          const MockWrapper(
            child: ErrorPage(),
          ),
        );

        await expectLater(
          find.byType(MockWrapper),
          matchesGoldenFile('goldens/error_page.png'),
        );
      });
    });
  });
}
