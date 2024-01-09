import 'package:flutter/foundation.dart';
import 'package:fomet_app/src/utils/widgets/version_code_checker.dart';
import 'package:fomet_ui/fomet_ui.dart';

/// The internal code of this application, which is matched against the value
/// on the Fomet server.
const serviceInternalCode = '10';

/// The icon size used in [VersionCodeChecker].
const versionCheckerIconSize = FometDimensions.space3x;

/// The icon size used by the adaptive dialog in [VersionCodeChecker].
const versionCheckerDialogIconSize = FometDimensions.space6x;

/// A [Set] of [TargetPlatform] values that indicates which platform support
/// scanning QR codes.
const qrScanSupportedPlatforms = {
  TargetPlatform.android,
  TargetPlatform.iOS,
  TargetPlatform.macOS,
};
