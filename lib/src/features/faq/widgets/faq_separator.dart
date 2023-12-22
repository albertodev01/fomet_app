import 'package:flutter/material.dart';
import 'package:fomet_app/src/utils/widgets/svg_asset_widgets.dart';

class FaqSeparator extends StatelessWidget {
  const FaqSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 48),
      child: Row(
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
