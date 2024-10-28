// Copyright 2020-2024 Hellogramming. All rights reserved.
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://hellogramming.com/weekdaycounters/license/.

import '../screens/home_screen.dart';

/// Application wide UI and URL string constants.
class AppStrings {
  static const String appName = 'Weekday Counters';

  // -----------------------------------------------------------------------------------------------
  // App Drawer
  // -----------------------------------------------------------------------------------------------

  static const String drawerTitle = appName;
  static const String settingsItemTitle = 'Settings';
  static const String aboutItemTitle = 'About this app';
  static const String viewSourceItemTitle = 'View source code';
  static const String rateItemTitle = 'Rate app';

  // -----------------------------------------------------------------------------------------------
  // Menu items and functionality
  // -----------------------------------------------------------------------------------------------

  static const Map<MenuAction, String> menuActions = {
    MenuAction.reset: 'Reset counter',
    MenuAction.share: 'Share...',
  };

  static const String resetConfirmTitle = 'Confirm';
  static const String resetConfirmMessage = 'Reset counter to zero?';
  static const String resetConfirmReset = 'Reset';
  static const String resetConfirmCancel = 'Cancel';

  static String shareText(String name, String value) => 'The $name is $value';

  static const String rateAppURL = 'https://hellogramming.com/weekdaycounters/rate/';

  static const String aboutURL = 'https://hellogramming.com/weekdaycounters/';

  static const String viewSourceURL = 'https://github.com/Hellogramming/weekday_counters';

  // -----------------------------------------------------------------------------------------------
  // Main functionality
  // -----------------------------------------------------------------------------------------------

  static const String incrementTooltip = 'Increment';
  static const String incrementHeroTag = 'incrementHeroTag';
  static const String decrementTooltip = 'Decrement';
  static const String decrementHeroTag = 'decrementHeroTag';

  // -----------------------------------------------------------------------------------------------
  // Settings
  // -----------------------------------------------------------------------------------------------

  static const String settingsTitle = 'Settings';
  static const String counterTapModeTitle = 'Counter tap mode';
  static const String counterTapModeSubtitle = 'Tap anywhere to increase counter';
}
