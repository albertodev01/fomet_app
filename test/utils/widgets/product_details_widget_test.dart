import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fomet_api_client/fomet_api_client.dart';
import 'package:fomet_app/src/utils/widgets/fomet_future_builder.dart';
import 'package:fomet_app/src/utils/widgets/logo_separator.dart';
import 'package:fomet_app/src/utils/widgets/product_details_widget.dart';
import 'package:fomet_ui/fomet_ui.dart';

import '../../mock_wrapper.dart';
import '../../test_utils.dart';

void main() {
  group('ProductDetailsWidget', () {
    const testProduct = (
      description: 'description',
      coverageFertilizer: 'coverage',
      preSowingFertilizer: 'pre-sowing',
      irrigationFertilizer: 'irrigation',
      rowFertilizer: 'row',
      springFertilizer: 'spring',
      autumnFertilizer: 'autumn',
      notes: 'notes notes notes',
      image: 'image.png',
      warning: 'none',
    );

    group('Widget tests', () {
      testWidgets('Smoke test', (tester) async {
        await setSurfaceSize(tester: tester, size: const Size(500, 900));

        await tester.pumpWidget(
          MockWrapper(
            child: ProductDetailsWidget(
              productInfo: testProduct,
              productCode: 'code',
              mockClient: FometMockClient.fromBytes(
                byteResponse: Uint8List.fromList(const [0]),
              ),
            ),
          ),
        );

        expect(find.byType(FometFutureBuilder<Uint8List>), findsOneWidget);
        expect(find.byType(FometCard), findsNWidgets(6));
        expect(find.byType(LogoSeparator), findsOneWidget);
        expect(find.text('notes notes notes'), findsOneWidget);
        expect(find.text('description'), findsOneWidget);
        expect(find.text('coverage'), findsOneWidget);
        expect(find.text('pre-sowing'), findsOneWidget);
        expect(find.text('irrigation'), findsOneWidget);
        expect(find.text('row'), findsOneWidget);
        expect(find.text('spring'), findsOneWidget);
        expect(find.text('autumn'), findsOneWidget);
      });
    });

    group('Golden tests', () {
      testWidgets('ProductDetailsWidget', (tester) async {
        await setSurfaceSize(tester: tester, size: const Size(500, 900));
        final image = await loadImageAsset(
          tester: tester,
          imageName: 'product_image',
        );

        await tester.pumpWidget(
          MockWrapper(
            child: ProductDetailsWidget(
              productInfo: testProduct,
              productCode: 'code',
              mockClient: FometMockClient.fromBytes(
                byteResponse: image,
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();

        await expectLater(
          find.byType(MockWrapper),
          matchesGoldenFile('goldens/product_details_widget.png'),
        );
      });

      testWidgets('ProductDetailsWidget - no notes', (tester) async {
        await setSurfaceSize(tester: tester, size: const Size(500, 900));
        final image = await loadImageAsset(
          tester: tester,
          imageName: 'product_image',
        );

        await tester.pumpWidget(
          MockWrapper(
            child: ProductDetailsWidget(
              productInfo: (
                description: 'description',
                coverageFertilizer: 'coverage',
                preSowingFertilizer: 'pre-sowing',
                irrigationFertilizer: 'irrigation',
                rowFertilizer: 'row',
                springFertilizer: 'spring',
                autumnFertilizer: 'autumn',
                notes: '',
                image: 'image.png',
                warning: 'none',
              ),
              productCode: 'code',
              mockClient: FometMockClient.fromBytes(
                byteResponse: image,
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();

        await expectLater(
          find.byType(MockWrapper),
          matchesGoldenFile('goldens/product_details_widget_no_notes.png'),
        );
      });
    });
  });
}
