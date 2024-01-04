import 'package:flutter_test/flutter_test.dart';
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
