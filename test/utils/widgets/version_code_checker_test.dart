import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fomet_app/src/utils/widgets/fomet_future_builder.dart';
import 'package:fomet_app/src/utils/widgets/version_code_checker.dart';

import '../../mock_wrapper.dart';

void main() {
  group('VersionCodeChecker', () {
    group('Widget tests', () {
      testWidgets('Smoke test', (tester) async {
        await tester.pumpWidget(
          MockWrapper(
            child: VersionCodeChecker(
              isUpdated: Future<bool>.value(true),
            ),
          ),
        );

        expect(find.byType(VersionCodeChecker), findsOneWidget);
        expect(find.byType(FometFutureBuilder<bool>), findsOneWidget);
        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      });

      testWidgets('Success', (tester) async {
        await tester.pumpWidget(
          MockWrapper(
            child: VersionCodeChecker(
              isUpdated: Future<bool>.value(true),
            ),
          ),
        );

        await tester.pumpAndSettle();

        expect(find.byType(VersionCodeChecker), findsOneWidget);
        expect(
          find.byKey(
            const Key('VersionCodeChecker-Success-Button'),
          ),
          findsOneWidget,
        );

        await tester.tap(find.byType(IconButton));
        await tester.pumpAndSettle();

        expect(
          find.byKey(const Key('VersionCodeChecker-AlertDialog')),
          findsOneWidget,
        );

        await tester.tap(find.byType(TextButton));
        await tester.pumpAndSettle();

        expect(find.byType(AlertDialog), findsNothing);
      });

      testWidgets('Warning', (tester) async {
        await tester.pumpWidget(
          MockWrapper(
            child: VersionCodeChecker(
              isUpdated: Future<bool>.value(false),
            ),
          ),
        );

        await tester.pumpAndSettle();

        expect(find.byType(VersionCodeChecker), findsOneWidget);
        expect(
          find.byKey(const Key('VersionCodeChecker-Warning-Button')),
          findsOneWidget,
        );

        await tester.tap(find.byType(IconButton));
        await tester.pumpAndSettle();

        expect(
          find.byKey(const Key('VersionCodeChecker-AlertDialog')),
          findsOneWidget,
        );

        await tester.tap(find.byType(TextButton));
        await tester.pumpAndSettle();

        expect(find.byType(AlertDialog), findsNothing);
      });

      testWidgets('Error', (tester) async {
        await tester.runAsync(
          () async => tester.pumpWidget(
            MockWrapper(
              child: VersionCodeChecker(
                isUpdated: Future<bool>.error(Exception('error')),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();

        expect(find.byType(VersionCodeChecker), findsOneWidget);
        expect(
          find.byKey(const Key('VersionCodeChecker-Error-Button')),
          findsOneWidget,
        );

        await tester.tap(find.byType(IconButton));
        await tester.pumpAndSettle();

        expect(
          find.byKey(const Key('VersionCodeChecker-AlertDialog')),
          findsOneWidget,
        );

        await tester.tap(find.byType(TextButton));
        await tester.pumpAndSettle();

        expect(find.byType(AlertDialog), findsNothing);
      });
    });

    group('Golden tests', () {
      testWidgets('VersionCodeChecker - success dialog', (tester) async {
        await tester.pumpWidget(
          MockWrapper(
            child: VersionCodeChecker(
              isUpdated: Future<bool>.value(true),
            ),
          ),
        );

        await tester.pumpAndSettle();

        await tester.tap(
          find.byKey(const Key('VersionCodeChecker-Success-Button')),
        );
        await tester.pumpAndSettle();

        await expectLater(
          find.byType(MockWrapper),
          matchesGoldenFile('goldens/version_checker_success.png'),
        );
      });

      testWidgets('VersionCodeChecker - warning dialog', (tester) async {
        await tester.pumpWidget(
          MockWrapper(
            child: VersionCodeChecker(
              isUpdated: Future<bool>.value(false),
            ),
          ),
        );

        await tester.pumpAndSettle();

        await tester.tap(
          find.byKey(const Key('VersionCodeChecker-Warning-Button')),
        );
        await tester.pumpAndSettle();

        await expectLater(
          find.byType(MockWrapper),
          matchesGoldenFile('goldens/version_checker_warning.png'),
        );
      });
    });

    testWidgets('VersionCodeChecker - error dialog', (tester) async {
      await tester.runAsync(
        () async => tester.pumpWidget(
          MockWrapper(
            child: VersionCodeChecker(
              isUpdated: Future<bool>.error(Exception('error')),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(
        find.byKey(const Key('VersionCodeChecker-Error-Button')),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MockWrapper),
        matchesGoldenFile('goldens/version_checker_error.png'),
      );
    });

    testWidgets('VersionCodeChecker - success dialog', (tester) async {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;

      await tester.pumpWidget(
        MockWrapper(
          child: VersionCodeChecker(
            isUpdated: Future<bool>.value(true),
          ),
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(
        find.byKey(const Key('VersionCodeChecker-Success-Button')),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MockWrapper),
        matchesGoldenFile('goldens/version_checker_success_ios.png'),
      );

      debugDefaultTargetPlatformOverride = null;
    });

    testWidgets('VersionCodeChecker - warning dialog', (tester) async {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;

      await tester.pumpWidget(
        MockWrapper(
          child: VersionCodeChecker(
            isUpdated: Future<bool>.value(false),
          ),
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(
        find.byKey(const Key('VersionCodeChecker-Warning-Button')),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MockWrapper),
        matchesGoldenFile('goldens/version_checker_warning_ios.png'),
      );

      debugDefaultTargetPlatformOverride = null;
    });

    testWidgets('VersionCodeChecker - error dialog', (tester) async {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;

      await tester.runAsync(
        () async => tester.pumpWidget(
          MockWrapper(
            child: VersionCodeChecker(
              isUpdated: Future<bool>.error(Exception('error')),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(
        find.byKey(const Key('VersionCodeChecker-Error-Button')),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MockWrapper),
        matchesGoldenFile('goldens/version_checker_error_ios.png'),
      );

      debugDefaultTargetPlatformOverride = null;
    });
  });
}
