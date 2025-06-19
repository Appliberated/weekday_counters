// Copyright 2020-2025 Appliberated. All rights reserved.
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://www.appliberated.com/weekdaycounters/license/.

import 'package:shared_preferences/shared_preferences.dart';

/// Persistent app settings.
class AppSettings {
  bool _counterTapMode = false;

  /// The setting for whether counters are incremented by tapping the screen.
  bool get counterTapMode => _counterTapMode;

  set counterTapMode(bool value) {
    _counterTapMode = value;
    _saveCounterTapMode();
  }

  static const String _counterTapModeKey = 'counterTapMode';

  /// Saves the counter tap mode to persistent storage.
  Future<void> _saveCounterTapMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_counterTapModeKey, _counterTapMode);
  }

  /// Loads app settings from persistent storage.
  Future<void> load() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _counterTapMode = prefs.getBool(_counterTapModeKey) ?? false;
  }
}
