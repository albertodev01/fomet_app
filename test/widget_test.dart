import 'package:flutter_test/flutter_test.dart';
import 'package:fomet_app/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (tester) async {
    await tester.pumpWidget(const FometApp());
    expect(find.byType(FometApp), findsOneWidget);
  });
}
