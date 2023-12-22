import 'package:flutter/material.dart';
import 'package:fomet_app/src/features/home/widgets/multiple_choice.dart';
import 'package:fomet_app/src/features/home/widgets/recent_searches.dart';
import 'package:fomet_app/src/localization/localization.dart';
import 'package:fomet_app/src/utils/widgets/svg_asset_widgets.dart';
import 'package:fomet_ui/fomet_ui.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // We're using 'SliverFillRemaining' because it makes the contents
        // fill the entire viewport and, on desktop or web, the scroll bar
        // appears on the right edge of the window (while the contents ALWAYS
        // stay at the center).
        SliverFillRemaining(
          hasScrollBody: false,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 16,
                    bottom: 32,
                  ),
                  child: Text(
                    context.l10n.homeIntroText,
                    style: FometTypography.regular,
                  ),
                ),
                Wrap(
                  runSpacing: 24,
                  spacing: 24,
                  alignment: WrapAlignment.center,
                  children: [
                    HomeOptionButton(
                      image: const CatalogSvg(height: 24, width: 24),
                      text: context.l10n.productsCatalog,
                      onTap: () {},
                    ),
                    HomeOptionButton(
                      image: const QRCodeSvg(height: 24, width: 24),
                      text: context.l10n.qrCode,
                      onTap: () {},
                    ),
                  ],
                ),
                const _Separator(),
                const RecentSearches(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _Separator extends StatelessWidget {
  const _Separator();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 56,
      ),
      child: Row(
        children: [
          Expanded(
            child: Divider(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: LogoSvg(
              width: 16,
              height: 16,
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
