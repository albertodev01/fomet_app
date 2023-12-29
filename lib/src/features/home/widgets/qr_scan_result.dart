import 'package:flutter/material.dart';
import 'package:fomet_api_client/fomet_api_client.dart';
import 'package:fomet_app/src/utils/widgets/fomet_future_builder.dart';
import 'package:url_launcher/url_launcher.dart';

class QRScanResult extends StatefulWidget {
  final String code;
  final VoidCallback onDialogClose;
  const QRScanResult({
    required this.code,
    required this.onDialogClose,
    super.key,
  });

  @override
  State<QRScanResult> createState() => _QRScanResultState();
}

class _QRScanResultState extends State<QRScanResult> {
  late final future = FometCodeValidationClient(
    productCode: widget.code,
  ).execute();

  @override
  Widget build(BuildContext context) {
    return FometFutureBuilder<bool>(
      future: future,
      onSuccess: (data) {
        return ElevatedButton(
          onPressed: () async {
            await launchUrl(
              Uri.parse(
                'https://ordini.fomet.it/appservice/fometappservicesvc/fometappservicews.svc/DownloadFile?mCodArt=${widget.code}',
              ),
            );
            if (mounted) {
              widget.onDialogClose();
              Navigator.of(context).pop();
            }
          },
          child: const Text('code'),
        );
      },
    );
  }
}
