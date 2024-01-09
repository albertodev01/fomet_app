import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fomet_app/src/localization/localization.dart';
import 'package:fomet_app/src/utils/constants.dart';
import 'package:fomet_app/src/utils/widgets/fomet_future_builder.dart';
import 'package:fomet_ui/fomet_ui.dart';

/// Uses the value of [isUpdated] to determine whether the application has the
/// same internal version code as the server.
class VersionCodeChecker extends StatelessWidget {
  /// Determines whether the application has the same internal version code as
  ///  the server.
  final Future<bool> isUpdated;

  /// Creates a [VersionCodeChecker] widget.
  const VersionCodeChecker({
    required this.isUpdated,
    super.key,
  });

  /// Shows an adaptive dialog based on the [isUpdated] value.
  Future<void> _showStatusMessage({
    required BuildContext context,
    required bool? isUpdated,
    required TargetPlatform targetPlatform,
  }) {
    final title = Text(context.l10n.updates);
    var subTitle = Text(context.l10n.checkUpdateError);

    // The icon at the center of the dialog
    Widget icon = const _ErrorIcon(size: versionCheckerDialogIconSize);

    if (isUpdated != null) {
      icon = isUpdated
          ? const _SuccessIcon(size: versionCheckerDialogIconSize)
          : const _WarningIcon(size: versionCheckerDialogIconSize);
      subTitle = isUpdated
          ? Text(context.l10n.checkUpdateSuccess)
          : Text(context.l10n.checkUpdateWarning);
    }

    // The adaptive button at the bottom of the dialog.
    final button = switch (targetPlatform) {
      TargetPlatform.iOS || TargetPlatform.macOS => CupertinoDialogAction(
          onPressed: Navigator.of(context).pop,
          child: Text(context.l10n.ok),
        ),
      _ => TextButton(
          onPressed: Navigator.of(context).pop,
          child: Text(context.l10n.ok),
        ),
    };

    // The adaptive dialog at the center of the screen.
    return showAdaptiveDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog.adaptive(
          key: const Key('VersionCodeChecker-AlertDialog'),
          title: title,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: FometDimensions.space1x),
              icon,
              const SizedBox(height: FometDimensions.space2x),
              subTitle,
            ],
          ),
          actions: [button],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final platform = Theme.of(context).platform;

    return FometFutureBuilder<bool>(
      future: isUpdated,
      errorWidget: IconButton(
        key: const Key('VersionCodeChecker-Error-Button'),
        onPressed: () async => _showStatusMessage(
          context: context,
          isUpdated: null,
          targetPlatform: platform,
        ),
        icon: const _ErrorIcon(),
      ),
      loadingWidget: const Center(
        child: SizedBox(
          width: FometDimensions.space2x,
          height: FometDimensions.space2x,
          child: CircularProgressIndicator.adaptive(
            strokeWidth: 2,
          ),
        ),
      ),
      onSuccess: (data) {
        if (data) {
          // App version code == server internal code -> updated!
          return IconButton(
            key: const Key('VersionCodeChecker-Success-Button'),
            onPressed: () async => _showStatusMessage(
              context: context,
              isUpdated: data,
              targetPlatform: platform,
            ),
            icon: const _SuccessIcon(),
          );
        } else {
          // App version code != server internal code -> update the app!
          return IconButton(
            key: const Key('VersionCodeChecker-Warning-Button'),
            onPressed: () async => _showStatusMessage(
              context: context,
              isUpdated: data,
              targetPlatform: platform,
            ),
            icon: const _WarningIcon(),
          );
        }
      },
    );
  }
}

class _SuccessIcon extends StatelessWidget {
  final double size;
  const _SuccessIcon({this.size = versionCheckerIconSize});

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.check,
      color: FometColors.primary,
      size: size,
    );
  }
}

class _ErrorIcon extends StatelessWidget {
  final double size;
  const _ErrorIcon({this.size = versionCheckerIconSize});

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.error_outline,
      color: FometColors.secondary,
      size: size,
    );
  }
}

class _WarningIcon extends StatelessWidget {
  final double size;
  const _WarningIcon({this.size = versionCheckerIconSize});

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.warning_rounded,
      color: Colors.amber,
      size: size,
    );
  }
}
