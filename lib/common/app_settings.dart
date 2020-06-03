import 'package:shared_preferences/shared_preferences.dart';

class AppSettings {
  bool _counterTapMode = false;

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
