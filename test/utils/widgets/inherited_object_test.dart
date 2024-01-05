import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fomet_app/src/utils/widgets/inherited_object.dart';

import '../../mock_wrapper.dart';

void main() {
  group('InheritedObject', () {
    test("'updateShouldNotify' is correctly overridden", () {
      const inheritedObject = InheritedObject<bool>(
        object: true,
        child: SizedBox.shrink(),
      );

      expect(
        inheritedObject.updateShouldNotify(inheritedObject),
        isFalse,
      );
      expect(
        inheritedObject.updateShouldNotify(
          const InheritedObject<bool>(
            object: true,
            child: SizedBox.shrink(),
          ),
        ),
        isFalse,
      );
      expect(
        inheritedObject.updateShouldNotify(
          const InheritedObject<bool>(
            object: false,
            child: SizedBox.shrink(),
          ),
        ),
        isTrue,
      );
    });

    testWidgets(
      "'of' does not throw when inherited widget is up in the tree",
      (tester) async {
        var value = true;

        await tester.pumpWidget(
          MockWrapper(
            child: InheritedObject<bool>(
              object: true,
              child: Builder(
                builder: (context) {
                  value = InheritedObject.of<bool>(context).object;

                  return const SizedBox.shrink();
                },
              ),
            ),
          ),
        );

        expect(value, isTrue);
      },
    );

    testWidgets(
      "'maybeOf' does not throw when inherited widget is up in the tree",
      (tester) async {
        bool? value = true;

        await tester.pumpWidget(
          MockWrapper(
            child: Builder(
              builder: (context) {
                value = InheritedObject.maybeOf<bool>(context)?.object;

                return const SizedBox.shrink();
              },
            ),
          ),
        );

        expect(value, isNull);
      },
    );
  });
}
