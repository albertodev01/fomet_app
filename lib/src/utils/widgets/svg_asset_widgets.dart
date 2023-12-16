import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// A base class for all of the SVG wrapper widgets.
abstract base class SvgImage extends StatelessWidget {
  /// The size of the svg image.
  ///
  /// By default, this is set to `40`.
  final double size;

  /// Creates a [SvgImage] widget,
  const SvgImage({
    super.key,
    this.size = 40,
  });

  /// The name of the Svg asset file.
  String get assetPath;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetPath,
      height: size,
      width: size,
    );
  }
}

/// An SVG asset of the application logo.
final class LogoSvg extends SvgImage {
  /// Creates a [LogoSvg] widget.
  const LogoSvg({
    super.size,
    super.key,
  });

  @override
  String get assetPath => 'assets/svg/logo.svg';
}
