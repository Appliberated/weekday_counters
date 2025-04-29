// Copyright 2020-2025 Tecdrop. All rights reserved.
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://www.tecdrop.com/weekdaycounters/license/.

// UI string constants used throughout the app.
library;

import '../screens/home_screen.dart';

const String appName = 'Weekday Counters';

// -----------------------------------------------------------------------------------------------
// App Drawer
// -----------------------------------------------------------------------------------------------

const String drawerTitle = appName;
const String settingsItemTitle = 'Settings';
const String aboutItemTitle = 'About this Hello World app';
const String viewSourceItemTitle = 'View source code';
const String feedbackItemTitle = 'Send feedback';

// -----------------------------------------------------------------------------------------------
// Menu items and functionality
// -----------------------------------------------------------------------------------------------

const Map<MenuAction, String> menuActions = {
  MenuAction.reset: 'Reset counter',
  MenuAction.share: 'Share...',
};

const String resetConfirmTitle = 'Confirm';
const String resetConfirmMessage = 'Reset counter to zero?';
const String resetConfirmReset = 'Reset';
const String resetConfirmCancel = 'Cancel';

String shareText(String name, String value) => 'The $name is $value';

// -----------------------------------------------------------------------------------------------
// Main functionality
// -----------------------------------------------------------------------------------------------

const String incrementTooltip = 'Increment';
const String incrementHeroTag = 'incrementHeroTag';
const String decrementTooltip = 'Decrement';
const String decrementHeroTag = 'decrementHeroTag';

// -----------------------------------------------------------------------------------------------
// Settings
// -----------------------------------------------------------------------------------------------

const String settingsTitle = 'Settings';
const String counterTapModeTitle = 'Counter tap mode';
const String counterTapModeSubtitle = 'Tap anywhere to increase counter';
