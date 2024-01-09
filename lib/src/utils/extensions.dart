import 'package:flutter/widgets.dart';

/// Extension methods on [BuildContext].
extension BuildContextX on BuildContext {
  /// Returns the two-letter language code (uppercase).
  String get languageCode =>
      Localizations.localeOf(this).languageCode.toUpperCase();
}
