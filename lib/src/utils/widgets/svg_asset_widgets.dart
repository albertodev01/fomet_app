import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// A base class for all of the SVG wrapper widgets.
abstract base class SvgImage extends StatelessWidget {
  /// The width of the vectorial asset.
  ///
  /// By default, this is set to `40`.
  final double width;

  /// The height of the vectorial asset.
  ///
  /// By default, this is set to `40`.
  final double height;

  /// Creates a [SvgImage] widget,
  const SvgImage({
    super.key,
    this.height = 40,
    this.width = 40,
  });

  /// The name of the Svg asset file.
  String get assetPath;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetPath,
      height: height,
      width: width,
    );
  }
}

/// The application logo.
final class LogoSvg extends SvgImage {
  /// Creates a [LogoSvg] widget.
  const LogoSvg({
    super.width,
    super.height,
    super.key,
  });

  @override
  String get assetPath => 'assets/svg/logo.svg';
}

/// The application logo along with the company name and slogan on the right.
final class BannerLogoSvg extends SvgImage {
  /// Creates a [BannerLogoSvg] widget.
  const BannerLogoSvg({
    super.width,
    super.height,
    super.key,
  });

  @override
  String get assetPath => 'assets/svg/logo_banner.svg';
}

/// A factory with a green leaf.
final class FactorySvg extends SvgImage {
  /// Creates a [FactorySvg] widget.
  const FactorySvg({
    super.width,
    super.height,
    super.key,
  });

  @override
  String get assetPath => 'assets/svg/factory_bio.svg';
}

/// A magnifying glass that zooms on a flask.
final class MagnifyingGlassSvg extends SvgImage {
  /// Creates a [MagnifyingGlassSvg] widget.
  const MagnifyingGlassSvg({
    super.width,
    super.height,
    super.key,
  });

  @override
  String get assetPath => 'assets/svg/magnifying_glass.svg';
}

/// A nice tractor.
final class TractorSvg extends SvgImage {
  /// Creates a [TractorSvg] widget.
  const TractorSvg({
    super.width,
    super.height,
    super.key,
  });

  @override
  String get assetPath => 'assets/svg/tractor.svg';
}

/// The Facebook logo.
final class FacebookSvg extends SvgImage {
  /// Creates a [FacebookSvg] widget.
  const FacebookSvg({
    super.width,
    super.height,
    super.key,
  });

  @override
  String get assetPath => 'assets/svg/facebook_logo.svg';
}

/// The Instagram logo.
final class InstagramSvg extends SvgImage {
  /// Creates a [InstagramSvg] widget.
  const InstagramSvg({
    super.width,
    super.height,
    super.key,
  });

  @override
  String get assetPath => 'assets/svg/instagram_logo.svg';
}

/// The Linkedin logo.
final class LinkedinSvg extends SvgImage {
  /// Creates a [LinkedinSvg] widget.
  const LinkedinSvg({
    super.width,
    super.height,
    super.key,
  });

  @override
  String get assetPath => 'assets/svg/linkedin_logo.svg';
}

/// The X logo.
final class XSvg extends SvgImage {
  /// Creates a[XSvg] widget.
  const XSvg({
    super.width,
    super.height,
    super.key,
  });

  @override
  String get assetPath => 'assets/svg/x_logo.svg';
}

/// The YouTube logo.
final class YouTubeSvg extends SvgImage {
  /// Creates a [YouTubeSvg] widget.
  const YouTubeSvg({
    super.width,
    super.height,
    super.key,
  });

  @override
  String get assetPath => 'assets/svg/youtube_logo.svg';
}

/// The image of a catalog with some powder at the bottom.
final class CatalogSvg extends SvgImage {
  /// Creates a [CatalogSvg] widget.
  const CatalogSvg({
    super.width,
    super.height,
    super.key,
  });

  @override
  String get assetPath => 'assets/svg/catalog.svg';
}

/// The image of a QR code.
final class QRCodeSvg extends SvgImage {
  /// Creates a [QRCodeSvg] widget.
  const QRCodeSvg({
    super.width,
    super.height,
    super.key,
  });

  @override
  String get assetPath => 'assets/svg/qr.svg';
}
