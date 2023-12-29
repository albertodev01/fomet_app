import 'package:flutter/material.dart';
import 'package:fomet_app/src/features/home/widgets/multiple_choice.dart';
import 'package:fomet_app/src/localization/localization.dart';
import 'package:fomet_app/src/routing/route_names.dart';
import 'package:fomet_app/src/utils/widgets/centered_scrollable_content.dart';
import 'package:fomet_app/src/utils/widgets/shell_page_wrapper.dart';
import 'package:fomet_app/src/utils/widgets/svg_asset_widgets.dart';
import 'package:fomet_ui/fomet_ui.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ShellPageWrapper(
      child: CenteredScrollableContent(
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
          HomeOptionButton(
            image: const CatalogSvg(height: 24, width: 24),
            text: context.l10n.productsCatalog,
            onTap: () async => context.push(catalogPagePath),
          ),
          const _Separator(),
          HomeOptionButton(
            image: const QRCodeSvg(height: 24, width: 24),
            text: context.l10n.qrCode,
            onTap: () async => context.push(qrScanPath),
          ),
        ],
      ),
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
