// Copyright 2020 Appliberated. All rights reserved.
// Use of this source code is governed by an MIT-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:weekday_counters/common/app_settings.dart';
import 'package:weekday_counters/common/app_strings.dart';
import 'package:weekday_counters/models/counter.dart';
import 'package:weekday_counters/screens/settings_screen.dart';
import 'package:weekday_counters/utils/utils.dart';
import 'package:weekday_counters/widgets/accept_cancel_dialog.dart';
import 'package:weekday_counters/widgets/counter_display.dart';
import 'package:weekday_counters/widgets/counters_drawer.dart';

/// Overflow menu items enumeration.
enum MenuAction { reset, share }

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /// The AppBar's action needs this key to find its own Scaffold.
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  /// The map of counters for each counter type.
  final Counters _counters = Counters();

  /// The current app settings.
  final AppSettings _appSettings = AppSettings();

  @override
  void initState() {
    super.initState();
    _loadCounters();
  }

  /// Loads counter values from persistent storage.
  Future<void> _loadCounters() async {
    await _counters.load();
    await _appSettings.load();
    setState(() {
      /* Refresh after loading counters. */
    });
  }

  /// Performs the tasks of the popup menu items (reset, share, rate, and help).
  void popupMenuSelection(MenuAction item) {
    switch (item) {
      case MenuAction.reset:
        // Reset the counter after asking for confirmation.
        showAcceptCancelDialog(
          context,
          AppStrings.resetConfirm,
          AppStrings.resetConfirmReset,
          AppStrings.resetConfirmCancel,
          () => setState(() => _counters.current.reset()),
        );
        break;
      case MenuAction.share:
        // Share the current counter value using the platform's share sheet.
        final String name = _counters.current.name;
        final String value = toDecimalString(context, _counters.current.value);
        Share.share(AppStrings.shareText(name, value), subject: name);
        break;
    }
  }

  void drawerExtraSelection(DrawerExtraActions item) {
    switch (item) {
      case DrawerExtraActions.settings:
        // Load the Settings screen
        _loadSettingsScreen();
        break;
      case DrawerExtraActions.help:
        // Launch the app online help url
        launchUrl(_scaffoldKey.currentState, AppStrings.helpURL);
        break;
      case DrawerExtraActions.rate:
        // Launch the Google Play Store page to allow the user to rate the app
        launchUrl(_scaffoldKey.currentState, AppStrings.rateAppURL);
        break;
    }
  }

  /// Navigates to the Settings screen, and refreshes on return.
  Future<void> _loadSettingsScreen() async {
    await Navigator.push<void>(context,
        MaterialPageRoute(builder: (context) => SettingsScreen(appSettings: _appSettings)));
    setState(() {
      /* Refresh after returning from Settings screen. */
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isPortrait = MediaQuery.of(context).size.height >= 500;

    final CounterDisplay counterDisplay = CounterDisplay(
      value: _counters.current.value,
      color: _counters.current.color,
      isPortrait: isPortrait,
    );

    return Scaffold(
      key: _scaffoldKey,
      appBar: _buildAppBar(),
      drawer: _buildDrawer(),
      body: _appSettings.counterTapMode
          ? GestureDetector(
              onTap: () => setState(() => _counters.current.increment()),
              child: counterDisplay,
            )
          : counterDisplay,
      floatingActionButton: !(_appSettings.counterTapMode) ? _buildFABs(isPortrait) : null,
    );
  }

  /// Builds the app bar with the popup menu items.
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: Text(_counters.current.name),
      actions: <Widget>[
        PopupMenuButton<MenuAction>(
          onSelected: popupMenuSelection,
          itemBuilder: _buildMenuItems,
        ),
      ],
    );
  }

  /// Builds the popup menu items for the app bar.
  List<PopupMenuItem<MenuAction>> _buildMenuItems(BuildContext context) {
    return MenuAction.values
        .map(
          (item) => PopupMenuItem<MenuAction>(
            value: item,
            child: Text(AppStrings.menuActions[item]),
            enabled: !(item == MenuAction.reset && _counters.current.value == 0),
          ),
        )
        .toList();
  }

  /// Builds the main drawer that lets the user switch between color counters.
  Widget _buildDrawer() {
    return CountersDrawer(
      title: AppStrings.drawerTitle,
      counters: _counters,
      onExtraSelected: drawerExtraSelection,
    );
  }

  /// Builds the two main floating action buttons for increment and decrement.
  Widget _buildFABs(bool isPortrait) {
    return Flex(
      direction: isPortrait ? Axis.vertical : Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        FloatingActionButton(
          heroTag: AppStrings.decrementHeroTag,
          onPressed: () => setState(() => _counters.current.decrement()),
          tooltip: AppStrings.decrementTooltip,
          child: const Icon(Icons.remove),
        ),
        isPortrait ? const SizedBox(height: 16.0) : const SizedBox(width: 16.0),
        FloatingActionButton(
          heroTag: AppStrings.incrementHeroTag,
          onPressed: () => setState(() => _counters.current.increment()),
          tooltip: AppStrings.incrementTooltip,
          child: const Icon(Icons.add),
        )
      ],
    );
  }
}
