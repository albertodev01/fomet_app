import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fomet_ui/fomet_ui.dart';

import '../mock_wrapper.dart';

void main() {
  group('FometButton', () {
    group('Widget tests', () {
      testWidgets('Smoke test', (tester) async {
        await tester.pumpWidget(
          MockWrapper(
            child: FometButton(
              onTap: () {},
              text: 'Hello',
            ),
          ),
        );

        expect(find.byType(FometButton), findsOneWidget);
        expect(find.byType(ValueListenableBuilder<bool>), findsOneWidget);
        expect(find.byType(AnimatedContainer), findsOneWidget);
        expect(find.text('Hello'), findsOneWidget);
      });

      testWidgets('Tap callback test', (tester) async {
        var tapped = false;

        await tester.pumpWidget(
          MockWrapper(
            child: FometButton(
              onTap: () => tapped = true,
              text: 'Hello',
            ),
          ),
        );

        expect(tapped, isFalse);

        await tester.tap(find.byType(FometButton));
        await tester.pumpAndSettle();

        expect(tapped, isTrue);
      });
    });

    group('Golden tests', () {
      testWidgets('FometButton', (tester) async {
        await tester.binding.setSurfaceSize(const Size(300, 100));

        await tester.pumpWidget(
          MockWrapper(
            child: Row(
              children: [
                FometButton(
                  onTap: () {},
                  text: 'Normal',
                ),
                FometButton(
                  onTap: () {},
                  text: 'Pressed',
                ),
              ],
            ),
          ),
        );

        await tester.press(find.byType(FometButton).last);
        await tester.pumpAndSettle();

        await expectLater(
          find.byType(MockWrapper),
          matchesGoldenFile('goldens/fomet_button.png'),
        );
      });

      testWidgets('FometButton with icon', (tester) async {
        await tester.binding.setSurfaceSize(const Size(400, 100));

        await tester.pumpWidget(
          MockWrapper(
            child: Row(
              children: [
                FometButton(
                  onTap: () {},
                  leadingIcon: const Icon(Icons.access_alarm),
                  text: 'Normal',
                ),
                FometButton(
                  onTap: () {},
                  leadingIcon: const Icon(Icons.access_alarm),
                  text: 'Pressed',
                ),
              ],
            ),
          ),
        );

        await tester.press(find.byType(FometButton).last);
        await tester.pumpAndSettle();

        await expectLater(
          find.byType(MockWrapper),
          matchesGoldenFile('goldens/fomet_button_with_icon.png'),
        );
      });
    });
  });
}
