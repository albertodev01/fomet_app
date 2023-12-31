import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fomet_ui/src/common/tokens.dart';

void main() {
  group('Tokens tests', () {
    test('FometBottomNavigationTokens', () {
      expect(
        FometBottomNavigationTokens.barBackgroundColor,
        equals(const Color(0xFFF6F6F6)),
      );
      expect(
        FometBottomNavigationTokens.dividersHeight,
        equals(2.0),
      );
      expect(
        FometBottomNavigationTokens.buttonItemInnerSpace,
        equals(2.0),
      );
    });

    test('FometButtonTokens', () {
      expect(
        FometButtonTokens.backgroundColorDuration,
        equals(const Duration(milliseconds: 150)),
      );
    });

    test('FometCardTokens', () {
      expect(
        FometCardTokens.backgroundColor,
        equals(Colors.white),
      );
      expect(
        FometCardTokens.elevation,
        equals(2.0),
      );
    });

    test('FometSideNavigationTokens', () {
      expect(
        FometSideNavigationTokens.borderColorDuration,
        equals(const Duration(milliseconds: 250)),
      );
      expect(
        FometSideNavigationTokens.sideBarWidth,
        equals(256.0),
      );
    });
  });
}
