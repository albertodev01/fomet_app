import 'package:flutter/material.dart';
import 'package:fomet_app/src/features/about/pages/about_page.dart';
import 'package:fomet_app/src/utils/widgets/svg_asset_widgets.dart';
import 'package:url_launcher/url_launcher.dart';

/// A series of tappable images that open social media accounts on the default
/// web browser. Used in [AboutPage].
class SocialLinks extends StatelessWidget {
  /// Creates a [SocialLinks] widget.
  const SocialLinks({super.key});

  Future<void> _launchUrl({required String url}) async {
    final uri = Uri.tryParse(url);

    if (uri != null) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 48),
      child: Wrap(
        runSpacing: 24,
        spacing: 48,
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.center,
        children: [
          GestureDetector(
            onTap: () async => _launchUrl(
              url: 'https://x.com/fometfert',
            ),
            child: const XSvg(
              width: 36,
              height: 36,
            ),
          ),
          GestureDetector(
            onTap: () async => _launchUrl(
              url: 'https://www.instagram.com/fometspa',
            ),
            child: const InstagramSvg(
              width: 36,
              height: 36,
            ),
          ),
          GestureDetector(
            onTap: () async => _launchUrl(
              url: 'https://www.facebook.com/FometSpa/',
            ),
            child: const FacebookSvg(
              width: 36,
              height: 36,
            ),
          ),
          GestureDetector(
            onTap: () async => _launchUrl(
              url: 'https://www.youtube.com/channel/UCFK4hFf4p0EL_SMT0mA2rSw',
            ),
            child: const YouTubeSvg(
              width: 36,
              height: 36,
            ),
          ),
          GestureDetector(
            onTap: () async => _launchUrl(
              url: 'https://www.linkedin.com/company/fomet-spa',
            ),
            child: const LinkedinSvg(
              width: 36,
              height: 36,
            ),
          ),
        ],
      ),
    );
  }
}
