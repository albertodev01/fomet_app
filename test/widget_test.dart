import 'package:flutter_test/flutter_test.dart';

import 'package:fomet_app/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('Hello!'), findsOneWidget);
  });
}
