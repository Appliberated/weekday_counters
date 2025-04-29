// Copyright 2020-2025 Tecdrop. All rights reserved.
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://www.tecdrop.com/weekdaycounters/license/.

import 'package:flutter/material.dart';

import '../common/strings.dart' as strings;
import '../models/counter.dart';
import '../utils/utils.dart';
import 'color_list_tile.dart';

/// Drawer extra actions enumeration.
enum DrawerExtraActions { settings, about, feedback, viewSource }

/// A material design drawer that shows navigation links for all available counters.
class CountersDrawer extends StatelessWidget {
  /// Creates a counters drawer widget.
  const CountersDrawer({
    super.key,
    required this.title,
    required this.counters,
    this.onExtraSelected,
  });

  /// The title of the drawer displayed in the drawer header.
  final String title;

  /// The map of counters.
  final Counters counters;

  /// Called when the user taps a drawer list tile.
  final void Function(DrawerExtraActions value)? onExtraSelected;

  /// Handles the tap event on an extra action.
  void _onExtraActionTap(BuildContext context, DrawerExtraActions action) {
    Navigator.pop(context); // Close the drawer
    onExtraSelected?.call(action);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListTileTheme(
        selectedColor: Colors.black,
        child: ListView(
          children: <Widget>[
            _buildDrawerHeader(context, counters.current.color),

            // Add a list tile for each counter type
            ...CounterType.values.map((type) => _buildCounterListTile(context, type)),

            const Divider(),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text(strings.settingsItemTitle),
              onTap: () => _onExtraActionTap(context, DrawerExtraActions.settings),
            ),
            ListTile(
              leading: const Icon(Icons.help),
              title: const Text(strings.aboutItemTitle),
              onTap: () => _onExtraActionTap(context, DrawerExtraActions.about),
            ),
            ListTile(
              leading: const Icon(Icons.source),
              title: const Text(strings.viewSourceItemTitle),
              onTap: () => _onExtraActionTap(context, DrawerExtraActions.viewSource),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.rate_review),
              title: const Text(strings.feedbackItemTitle),
              onTap: () => _onExtraActionTap(context, DrawerExtraActions.feedback),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds the drawer header.
  Widget _buildDrawerHeader(BuildContext context, Color color) {
    return DrawerHeader(
      decoration: BoxDecoration(color: Colors.grey[50]),
      child: Center(
        child: Text(title, style: Theme.of(context).textTheme.titleLarge?.copyWith(color: color)),
      ),
    );
  }

  /// Builds a list tile for the counter of the specified type.
  Widget _buildCounterListTile(BuildContext context, CounterType counterType) {
    return ColorListTile(
      color: Counter.colorOf(counterType),
      title: Counter.nameOf(counterType),
      subtitle: toDecimalString(context, counters[counterType].value),
      enabled: counterType == counters.current.type,
      selected: counterType == counters.current.type,
      onTap: () => Navigator.pop(context),
    );
  }
}
