import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fomet_app/src/features/about/widgets/list_entry_item.dart';
import 'package:fomet_app/src/features/about/widgets/social_links.dart';
import 'package:fomet_app/src/localization/localization.dart';
import 'package:fomet_app/src/utils/widgets/svg_asset_widgets.dart';
import 'package:fomet_ui/fomet_ui.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 32),
          child: BannerLogoSvg(
            height: 64,
          ),
        ),
        Text(
          context.l10n.infoParagraph1,
          style: FometTypography.regular,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 32),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TractorSvg(
                  width: 72,
                  height: 72,
                ),
                SizedBox(width: 24),
                FactorySvg(
                  width: 72,
                  height: 72,
                ),
              ],
            ),
          ),
        ),
        Text(
          context.l10n.infoParagraph2,
          style: FometTypography.regular,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 32),
          child: MagnifyingGlassSvg(
            width: 84,
            height: 84,
          ),
        ),
        Text(
          context.l10n.infoParagraph3,
          style: FometTypography.regular,
        ),
        const SizedBox(height: 4),
        Text(
          context.l10n.infoParagraph4,
          style: FometTypography.regular,
        ),
        ListEntryItem(
          text: Text(
            context.l10n.infoParagraph5,
            style: FometTypography.regular,
          ),
          value: 1,
        ),
        ListEntryItem(
          text: Text(
            context.l10n.infoParagraph6,
            style: FometTypography.regular,
          ),
          value: 2,
        ),
        ListEntryItem(
          text: Text(
            context.l10n.infoParagraph7,
            style: FometTypography.regular,
          ),
          value: 3,
        ),
        Text(
          context.l10n.infoParagraph8,
          style: FometTypography.regular,
        ),
        const SocialLinks(),
        const Text(
          'Fomet S.p.A - Via Vialarga 25, 37050 San Pietro di Morubio (VR)',
          style: FometTypography.captionSmall,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
