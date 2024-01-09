import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fomet_app/src/features/home/widgets/catalog/section_header.dart';

import '../../../../mock_wrapper.dart';
import '../../../../test_utils.dart';

void main() {
  group('SectionHeader', () {
    group('Widget tests', () {
      testWidgets('Smoke test', (tester) async {
        await tester.pumpWidget(
          const MockWrapper(
            child: SectionHeader(
              title: 'title',
            ),
          ),
        );

        expect(find.byType(SectionHeader), findsOneWidget);
        expect(find.text('title'), findsOneWidget);
        expect(find.byType(IconButton), findsNWidgets(2));
      });

      testWidgets('Close button tap override', (tester) async {
        var tapped = false;

        await tester.pumpWidget(
          MockWrapper(
            child: SectionHeader(
              title: 'title',
              closeButtonTap: () => tapped = true,
            ),
          ),
        );

        expect(tapped, isFalse);

        await tester.tap(find.byType(IconButton).last);
        await tester.pumpAndSettle();

        expect(tapped, isTrue);
      });
    });

    group('Golden tests', () {
      testWidgets('SectionHeader', (tester) async {
        await setSurfaceSize(tester: tester, size: const Size(400, 200));

        await tester.pumpWidget(
          const MockWrapper(
            child: SectionHeader(
              title: 'title',
            ),
          ),
        );

        await expectLater(
          find.byType(MockWrapper),
          matchesGoldenFile('goldens/section_header.png'),
        );
      });

      testWidgets('SectionHeader - back button', (tester) async {
        await setSurfaceSize(tester: tester, size: const Size(400, 200));

        await tester.pumpWidget(
          MockWrapper(
            child: SectionHeader(
              title: 'title',
              backButtonTap: () {},
            ),
          ),
        );

        await expectLater(
          find.byType(MockWrapper),
          matchesGoldenFile('goldens/section_header_back_button.png'),
        );
      });
    });
  });
}
