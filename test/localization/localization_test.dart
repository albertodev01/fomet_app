import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fomet_app/src/localization/localization.dart';

import 'english_strings.dart';
import 'italian_strings.dart';

void main() {
  void checklocalizedStringsLengths({
    required AppLocalizations appLocalizations,
    required List<String> localizedValues,
  }) {
    final values = [
      appLocalizations.appTitle,
      appLocalizations.pageNotFoundText,
      appLocalizations.home,
      appLocalizations.products,
      appLocalizations.faq,
      appLocalizations.about,
      appLocalizations.fomet,
      appLocalizations.fometSubtitle,
      appLocalizations.errorWidgetTitle,
      appLocalizations.errorWidgetSubitle,
      appLocalizations.infoParagraph1,
      appLocalizations.infoParagraph2,
      appLocalizations.infoParagraph3,
      appLocalizations.infoParagraph4,
      appLocalizations.infoParagraph5,
      appLocalizations.infoParagraph6,
      appLocalizations.infoParagraph7,
      appLocalizations.infoParagraph8,
      appLocalizations.question1,
      appLocalizations.answer1,
      appLocalizations.question2,
      appLocalizations.answer2,
      appLocalizations.question3,
      appLocalizations.answer3,
      appLocalizations.question4,
      appLocalizations.answer4,
      appLocalizations.question5,
      appLocalizations.answer5,
      appLocalizations.question6,
      appLocalizations.answer6,
      appLocalizations.question7,
      appLocalizations.answer7,
      appLocalizations.productsLoadingText,
      appLocalizations.search,
      appLocalizations.qrCode,
      appLocalizations.productsCatalog,
      appLocalizations.recentSearches,
      appLocalizations.or,
      appLocalizations.homeIntroText,
      appLocalizations.category,
      appLocalizations.variety,
      appLocalizations.kind,
      appLocalizations.qrCodeHint,
      appLocalizations.qrCodeError,
    ];

    expect(values.length, equals(44));
    expect(values.length, equals(localizedValues.length));

    for (var i = 0; i < values.length; ++i) {
      values[i] = localizedValues[i];
    }
  }

  group('Localization', () {
    testWidgets('Localization works on context', (tester) async {
      late final AppLocalizations? localizations;

      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Builder(
            builder: (context) {
              localizations = AppLocalizations.of(context);

              return const SizedBox();
            },
          ),
        ),
      );

      expect(localizations, isNotNull);
    });

    testWidgets('English is correctly loaded', (tester) async {
      late AppLocalizations localizations;

      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Builder(
            builder: (context) {
              localizations = AppLocalizations.of(context);

              return const SizedBox();
            },
          ),
        ),
      );

      expect(localizations.localeName, equals('en'));
      checklocalizedStringsLengths(
        appLocalizations: localizations,
        localizedValues: englishStrings.values.toList(growable: false),
      );
    });

    testWidgets('Making sure that Italian is correctly loaded', (tester) async {
      late AppLocalizations localizations;

      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: const Locale('it'),
          home: Builder(
            builder: (context) {
              localizations = AppLocalizations.of(context);

              return const SizedBox();
            },
          ),
        ),
      );

      expect(localizations.localeName, equals('it'));
      checklocalizedStringsLengths(
        appLocalizations: localizations,
        localizedValues: italianStrings.values.toList(growable: false),
      );
    });
  });
}
