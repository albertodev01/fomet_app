import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fomet_app/src/utils/extensions.dart';

import '../mock_wrapper.dart';

void main() {
  group('Extension methods', () {
    testWidgets('BuildContextX', (tester) async {
      var locale = '';

      await tester.pumpWidget(
        MockWrapper(
          child: Builder(
            builder: (context) {
              locale = context.languageCode;
              return const Text('hello');
            },
          ),
        ),
      );

      expect(locale, equals('EN'));
    });
  });
}
