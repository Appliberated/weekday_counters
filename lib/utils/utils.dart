// Copyright 2020-2024 Appliberated (https://appliberated.com). All rights reserved.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// @author TechAurelian <dev@techaurelian.com> (https://techaurelian.com)

import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

/// Formats [number] as a decimal, inserting locale-appropriate thousands separators as necessary.
String toDecimalString(BuildContext context, int number) {
  final MaterialLocalizations localizations = MaterialLocalizations.of(context);
  return localizations.formatDecimal(number);
}

/// Launches the specified [URL] in the mobile platform.
Future<void> launchUrlExternal(String url) async {
  if (!await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication)) {
    debugPrint('Failed to open $url');
  }
}

/// Utility Color extension methods.
extension ColorX on Color {
  /// Returns the contrast color for this color.
  Color contrastOf() =>
      ThemeData.estimateBrightnessForColor(this) == Brightness.light ? Colors.black : Colors.white;
}
