// Copyright 2020-2024 Hellogramming. All rights reserved.
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://hellogramming.com/weekdaycounters/license/.

import 'package:flutter/material.dart';

import '../common/app_settings.dart';
import '../common/strings.dart' as strings;

/// The app settings screen.
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({
    super.key,
    required this.appSettings,
  });

  /// The app settings that can be changed in this screen.
  final AppSettings appSettings;

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(strings.settingsTitle),
      ),
      body: ListView(
        children: <Widget>[
          // Add the counter tap mode switch list tile
          SwitchListTile(
            activeColor: Colors.black,
            value: widget.appSettings.counterTapMode,
            title: const Text(strings.counterTapModeTitle),
            subtitle: const Text(strings.counterTapModeSubtitle),
            onChanged: (bool value) => setState(() => widget.appSettings.counterTapMode = value),
          )
        ],
      ),
    );
  }
}
