// Copyright 2020 Appliberated. All rights reserved.
// Use of this source code is governed by an MIT-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:weekday_counters/common/app_settings.dart';
import 'package:weekday_counters/common/app_strings.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({
    Key key,
    @required this.appSettings,
  })  : assert(appSettings != null),
        super(key: key);

  final AppSettings appSettings;

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.settingsTitle),
      ),
      body: ListView(
        children: [
          SwitchListTile(
            value: widget.appSettings.counterTapMode,
            title: Text(AppStrings.counterTapModeTitle),
            subtitle: Text(AppStrings.counterTapModeSubtitle),
            onChanged: (bool value) => setState(() => widget.appSettings.counterTapMode = value),
          )
        ],
      ),
    );
  }
}
