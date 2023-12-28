import 'package:flutter/material.dart';
import 'package:fomet_app/src/features/home/widgets/qr_scan_result.dart';
import 'package:fomet_app/src/localization/localization.dart';
import 'package:fomet_ui/fomet_ui.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRScanPage extends StatefulWidget {
  const QRScanPage({super.key});

  @override
  State<QRScanPage> createState() => _QRScanPageState();
}

class _QRScanPageState extends State<QRScanPage> {
  final controller = MobileScannerController(
    detectionSpeed: DetectionSpeed.noDuplicates,
  );

  final scannedCode = ValueNotifier<String>('');
  bool canScan = true;

  Future<void> showProductDialog({
    required BuildContext context,
    required String code,
  }) async {
    await showAdaptiveDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog.adaptive(
          title: const Text('QR code'),
          content: QRScanResult(
            code: code,
            onDialogClose: () => canScan = true,
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();

    scannedCode.addListener(() async {
      await showProductDialog(context: context, code: scannedCode.value);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Text(
              context.l10n.qrCodeHint,
              style: FometTypography.regular,
            ),
          ),
          Expanded(
            child: DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(color: FometColors.primary, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: MobileScanner(
                controller: controller,
                onDetect: (capture) {
                  final code = capture.barcodes.first.rawValue;

                  if (canScan && code != null && scannedCode.value != code) {
                    debugPrint('code = $code');
                    canScan = false;
                    scannedCode.value = code;
                  }
                },
                placeholderBuilder: (_, __) => const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
