import 'package:flutter/material.dart';
import 'package:fomet_app/src/utils/widgets/svg_asset_widgets.dart';

/// Used to visually separate contents of a page. This widget is made up of two
/// [Divider] widgets on the side and [LogoSvg] in the middle.
class LogoSeparator extends StatelessWidget {
  /// The padding around the separator.
  ///
  /// By default, this is set to:
  ///
  /// ```dart
  /// const EdgeInsets.symmetric(
  ///   horizontal: 24,
  ///   vertical: 48,
  /// ),
  /// ```
  final EdgeInsets padding;

  /// Creates a [LogoSeparator] widget.
  const LogoSeparator({
    this.padding = const EdgeInsets.symmetric(
      horizontal: 24,
      vertical: 48,
    ),
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: const Row(
        children: [
          Expanded(
            child: Divider(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: LogoSvg(
              width: 24,
              height: 24,
            ),
          ),
          Expanded(
            child: Divider(),
          ),
        ],
      ),
    );
  }
}
