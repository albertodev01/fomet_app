import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fomet_app/src/features/faq/pages/faq_page.dart';
import 'package:fomet_app/src/features/faq/widgets/question_answer.dart';
import 'package:fomet_app/src/utils/widgets/logo_separator.dart';

import '../../../mock_wrapper.dart';
import '../../../test_utils.dart';

void main() {
  group('FaqPage', () {
    group('Widget tests', () {
      testWidgets('Smoke test', (tester) async {
        await setSurfaceSize(tester: tester, size: const Size(800, 1900));

        await tester.pumpWidget(
          const MockWrapper(
            child: FaqPage(),
          ),
        );

        expect(find.byType(FaqPage), findsOneWidget);

        // Images
        expect(find.byType(LogoSeparator), findsNWidgets(6));
        expect(find.byType(QuestionAnswer), findsNWidgets(7));
        expect(find.byType(ListView), findsOneWidget);
      });
    });

    group('Golden tests', () {
      testWidgets('FaqPage', (tester) async {
        await setSurfaceSize(tester: tester, size: const Size(800, 1900));

        await tester.pumpWidget(
          const MockWrapper(
            child: FaqPage(),
          ),
        );

        await expectLater(
          find.byType(MockWrapper),
          matchesGoldenFile('goldens/faq_page.png'),
        );
      });
    });
  });
}
