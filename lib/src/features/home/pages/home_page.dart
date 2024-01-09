import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fomet_app/src/localization/localization.dart';
import 'package:fomet_app/src/routing/route_names.dart';
import 'package:fomet_app/src/utils/constants.dart';
import 'package:fomet_app/src/utils/widgets/centered_scrollable_content.dart';
import 'package:fomet_app/src/utils/widgets/logo_separator.dart';
import 'package:fomet_app/src/utils/widgets/svg_asset_widgets.dart';
import 'package:fomet_ui/fomet_ui.dart';
import 'package:go_router/go_router.dart';

/// The home page has a brief introductory text and then two buttons: one for
/// finding Fomet products in the online catalog and one (if available) for
/// scanning product's QR codes.
///
/// The [qrScanSupportedPlatforms] property defines which platforms support QR
/// code scanning.
class HomePage extends StatelessWidget {
  /// Creates a [HomePage] widget.
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Determines whether the QR scan feature should be enabled
    final supported = kIsWeb ||
        qrScanSupportedPlatforms.contains(
          Theme.of(context).platform,
        );

    return CenteredScrollableContent(
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
        FometButton(
          leadingIcon: const CatalogSvg(height: 24, width: 24),
          text: context.l10n.productsCatalog,
          onTap: () async => context.push(catalogPagePath),
        ),
        if (supported) ...[
          const LogoSeparator(
            padding: EdgeInsets.symmetric(
              horizontal: 32,
              vertical: 56,
            ),
          ),
          FometButton(
            leadingIcon: const QRCodeSvg(height: 24, width: 24),
            text: context.l10n.qrCode,
            onTap: () async => context.push(qrScanPath),
          ),
        ],
      ],
    );
  }
}
