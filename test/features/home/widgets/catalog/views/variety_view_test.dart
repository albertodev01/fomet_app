import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fomet_api_client/fomet_api_client.dart';
import 'package:fomet_app/src/features/home/state/catalog_page_state.dart';
import 'package:fomet_app/src/features/home/widgets/catalog/section_header.dart';
import 'package:fomet_app/src/features/home/widgets/catalog/views/variety_view.dart';
import 'package:fomet_app/src/utils/widgets/fomet_future_builder.dart';
import 'package:fomet_app/src/utils/widgets/inherited_object.dart';
import 'package:fomet_ui/fomet_ui.dart';

import '../../../../../mock_wrapper.dart';

void main() {
  group('VarietyView', () {
    group('Widget tests', () {
      testWidgets('Smoke test', (tester) async {
        await tester.pumpWidget(
          InheritedObject<CatalogPageState>(
            object: CatalogPageState()
              ..category = const (code: 'ALB', description: 'Alberi da frutto'),
            child: MockWrapper(
              child: VarietyView(
                controller: PageController(),
                mockClient: FometMockClient(response: varietyTestResponse),
              ),
            ),
          ),
        );

        expect(find.byType(VarietyView), findsOneWidget);
        expect(find.byType(SectionHeader), findsOneWidget);
        expect(
          find.byType(FometFutureBuilder<List<FometCatalogItem>>),
          findsOneWidget,
        );
        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      });

      testWidgets('Tap on item', (tester) async {
        final controller = PageController(initialPage: 1);
        final state = CatalogPageState()
          ..category = const (code: 'ALB', description: 'Alberi da frutto');

        addTearDown(controller.dispose);

        await tester.pumpWidget(
          InheritedObject<CatalogPageState>(
            object: state,
            child: MockWrapper(
              child: PageView(
                controller: controller,
                children: [
                  const Text('category view'),
                  VarietyView(
                    controller: controller,
                    mockClient: FometMockClient(response: varietyTestResponse),
                  ),
                  const Text('kind view'),
                ],
              ),
            ),
          ),
        );

        await tester.pump();

        expect(find.byType(VarietyView), findsOneWidget);
        expect(find.byType(FometCard), findsNWidgets(3));

        await tester.tap(find.byType(FometCard).first);
        await tester.pumpAndSettle();

        expect(
          state.variety,
          equals(const (code: 'ACT', description: 'Actinidia')),
        );
        expect(find.text('kind view'), findsOneWidget);
        expect(find.byType(VarietyView), findsNothing);
      });
    });

    group('Golden tests', () {
      testWidgets('SectionHeader', (tester) async {
        await tester.pumpWidget(
          InheritedObject<CatalogPageState>(
            object: CatalogPageState(),
            child: MockWrapper(
              child: VarietyView(
                controller: PageController(),
                mockClient: FometMockClient(response: varietyTestResponse),
              ),
            ),
          ),
        );

        await tester.pump();

        await expectLater(
          find.byType(MockWrapper),
          matchesGoldenFile('goldens/variety_view.png'),
        );
      });
    });
  });
}

/// An example of a valid XML response for the categories list.
const varietyTestResponse = '''
<ElencoVarieta xmlns="http://schemas.datacontract.org/2004/07/FometAppService.CVarieta" xmlns:i="http://www.w3.org/2001/XMLSchema-instance">
    <Varieta>
        <itemV>
            <Codice>ACT</Codice>
            <Descrizione>Actinidia</Descrizione>
        </itemV>
        <itemV>
            <Codice>CAS</Codice>
            <Descrizione>Castagno</Descrizione>
        </itemV>
        <itemV>
            <Codice>NOE</Codice>
            <Descrizione>Noce</Descrizione>
        </itemV>
    </Varieta>
</ElencoVarieta>
''';
