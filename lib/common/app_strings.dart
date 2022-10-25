// Copyright 2020-2022 TechAurelian. All rights reserved.
// Use of this source code is governed by an MIT-style license that can be
// found in the LICENSE file.

import 'package:weekday_counters/screens/home.dart';

/// Application wide UI and URL string constants.
class AppStrings {
  static const String appName = 'Weekday Counters';

  //#region Drawer

  static const String drawerTitle = appName;
  static const String settingsItemTitle = 'Settings';
  static const String helpItemTitle = 'Help & feedback';
  static const String rateItemTitle = 'Rate app';

  //#endregion

  //#region Menu items and functionality

  static const Map<MenuAction, String> menuActions = {
    MenuAction.reset: 'Reset counter',
    MenuAction.share: 'Share...',
  };

  static const String resetConfirm = 'Reset counter to zero?';
  static const String resetConfirmReset = 'Reset';
  static const String resetConfirmCancel = 'Cancel';

  static String shareText(String name, String value) => 'The $name is $value';

  static const String rateAppURL =
      'https://play.google.com/store/apps/details?id=com.appliberated.weekdaycounters';

  static const String helpURL = 'https://techaurelian.com/weekdaycounters/';

  //#endregion

  //#region Main functionality

  static const String incrementTooltip = 'Increment';
  static const String incrementHeroTag = 'incrementHeroTag';
  static const String decrementTooltip = 'Decrement';
  static const String decrementHeroTag = 'decrementHeroTag';

  //#endregion

  //#region Settings

  static const String settingsTitle = 'Settings';
  static const String counterTapModeTitle = 'Counter tap mode';
  static const String counterTapModeSubtitle = 'Tap anywhere to increase counter';

//#endregion
}
