import 'package:flutter/material.dart';
import 'package:fomet_api_client/fomet_api_client.dart';
import 'package:fomet_app/src/utils/widgets/fomet_future_builder.dart';
import 'package:fomet_ui/fomet_ui.dart';

class VersionCodeChecker extends StatefulWidget {
  const VersionCodeChecker({super.key});

  @override
  State<VersionCodeChecker> createState() => _VersionCodeCheckerState();
}

class _VersionCodeCheckerState extends State<VersionCodeChecker> {
  final future = const FometAppVersionClient(
    //currentVersionCode: serviceInternalCode,
    currentVersionCode: '6',
  ).execute();

  Future<void> showStatusMessage({
    required bool isUpdated,
  }) {
    final title =
        isUpdated ? const Text('All good!') : const Text('Update available');
    final icon = isUpdated
        ? const Icon(
            Icons.check,
            color: FometColors.primary,
            size: 36,
          )
        : const Icon(
            Icons.warning_rounded,
            color: Colors.amber,
            size: 36,
          );

    return showAdaptiveDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog.adaptive(
          title: title,
          content: icon,
          actions: [
            ElevatedButton(
              onPressed: Navigator.of(context).pop,
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FometFutureBuilder<bool>(
      future: future,
      onSuccess: (data) {
        if (data) {
          return IconButton(
            onPressed: () async => showStatusMessage(isUpdated: data),
            icon: const Icon(
              Icons.check,
              color: FometColors.primary,
            ),
          );
        } else {
          return IconButton(
            onPressed: () async => showStatusMessage(isUpdated: data),
            icon: const Icon(
              Icons.warning_rounded,
              color: Colors.amber,
            ),
          );
        }
      },
    );
  }
}
