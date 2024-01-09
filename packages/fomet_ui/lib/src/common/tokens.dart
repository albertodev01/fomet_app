import 'package:flutter/material.dart';
import 'package:fomet_ui/fomet_ui.dart';

/// Tokens for the [FometBottomNavigationBar] component.
abstract final class FometBottomNavigationTokens {
  /// Separator widget's height.
  static const dividersHeight = 2.0;

  /// Navigation bar's backround color.
  static const barBackgroundColor = Color(0xFFF6F6F6);

  /// The space between the icon and the text of a bottom navigation item.
  static const buttonItemInnerSpace = 2.0;
}

/// Tokens for the [FometButton] component.
abstract final class FometButtonTokens {
  /// Background animation color duration.
  static const backgroundColorDuration = Duration(milliseconds: 150);
}

/// Tokens for the [FometCard] component.
abstract final class FometCardTokens {
  /// Background animation color duration.
  static const backgroundColor = Colors.white;

  /// The card elevation.
  static const elevation = 2.0;
}

/// Tokens for the [FometSideNavigationBar] component.
abstract final class FometSideNavigationTokens {
  /// How long the sidebar is.
  static const sideBarWidth = 256.0;

  /// Border animation color duration.
  static const borderColorDuration = Duration(milliseconds: 250);
}
