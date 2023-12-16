import 'package:flutter/material.dart';
import 'package:fomet_ui/fomet_ui.dart';

/// Font styles from the Fomet UI component library.
abstract final class FometTypography {
  /// Regular.
  static const regular = TextStyle(
    fontFamily: 'Mukta',
    fontWeight: FontWeight.w400,
    color: FometColors.primaryText,
    overflow: TextOverflow.ellipsis,
  );

  /// Bold.
  static const bold = TextStyle(
    fontFamily: 'Mukta',
    fontWeight: FontWeight.w700,
    color: FometColors.primaryText,
    overflow: TextOverflow.ellipsis,
  );

  /// Light.
  static const light = TextStyle(
    fontFamily: 'Mukta',
    fontWeight: FontWeight.w300,
    color: FometColors.primaryText,
    overflow: TextOverflow.ellipsis,
  );

  /// Medium.
  static const medium = TextStyle(
    fontFamily: 'Mukta',
    fontWeight: FontWeight.w500,
    color: FometColors.primaryText,
    overflow: TextOverflow.ellipsis,
  );

  /// Semi bold.
  static const semiBold = TextStyle(
    fontFamily: 'Mukta',
    fontWeight: FontWeight.w600,
    color: FometColors.primaryText,
    overflow: TextOverflow.ellipsis,
  );
}
