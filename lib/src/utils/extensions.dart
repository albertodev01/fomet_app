import 'package:flutter/widgets.dart';

extension BuildContextX on BuildContext {
  String get languageCode =>
      Localizations.localeOf(this).languageCode.toUpperCase();
}
