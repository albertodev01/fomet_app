import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fomet_app/src/utils/widgets/fomet_future_builder.dart';

import '../../mock_wrapper.dart';
import '../../test_utils.dart';

void main() {
  group('FometFutureBuilder', () {
    group('Widget tests', () {
      testWidgets('Smoke test', (tester) async {
        await tester.pumpWidget(
          MockWrapper(
            child: FometFutureBuilder<String>(
              future: Future.value('Hello'),
              onSuccess: Text.new,
            ),
          ),
        );

        expect(find.byType(FometFutureBuilder<String>), findsOneWidget);
        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      });

      testWidgets('Custom loading', (tester) async {
        await tester.pumpWidget(
          MockWrapper(
            child: FometFutureBuilder<String>(
              future: Future.value('Hello'),
              loadingWidget: const Text('loading'),
              onSuccess: Text.new,
            ),
          ),
        );

        expect(find.byType(FometFutureBuilder<String>), findsOneWidget);
        expect(find.text('loading'), findsOneWidget);
      });

      testWidgets('Custom error', (tester) async {
        await tester.runAsync(
          () => tester.pumpWidget(
            MockWrapper(
              child: FometFutureBuilder<String>(
                future: Future.error(Exception('Hello')),
                errorWidget: const Text('error'),
                onSuccess: Text.new,
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();

        expect(find.byType(FometFutureBuilder<String>), findsOneWidget);
        expect(find.text('error'), findsOneWidget);
      });
    });

    group('Golden tests', () {
      testWidgets('FometFutureBuilder - Success', (tester) async {
        await setSurfaceSize(tester: tester, size: const Size(200, 200));

        await tester.pumpWidget(
          MockWrapper(
            child: FometFutureBuilder<String>(
              future: Future.value('Hello'),
              onSuccess: Text.new,
            ),
          ),
        );

        await tester.pumpAndSettle();

        await expectLater(
          find.byType(MockWrapper),
          matchesGoldenFile('goldens/fomet_future_builder_success.png'),
        );
      });

      testWidgets('FometFutureBuilder - Error', (tester) async {
        await setSurfaceSize(tester: tester, size: const Size(400, 400));

        await tester.runAsync(
          () => tester.pumpWidget(
            MockWrapper(
              child: FometFutureBuilder<String>(
                future: Future.error(Exception('Hello')),
                onSuccess: Text.new,
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();

        await expectLater(
          find.byType(MockWrapper),
          matchesGoldenFile('goldens/fomet_future_builder_error.png'),
        );
      });
    });
  });
}
