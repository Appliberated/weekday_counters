// Copyright 2020-2022 TechAurelian. All rights reserved.
// Use of this source code is governed by an MIT-style license that can be
// found in the LICENSE file.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

/// Counter (color) types.
enum CounterType { monday, tuesday, wednesday, thursday, friday, saturday, sunday }

/// An integer counter class.
class Counter {
  /// Creates a counter of the specified [type].
  Counter(this.type);

  //#region Counter value

  /// The counter value.
  int _value = 0;

  /// Returns the counter value.
  int get value => _value;

  /// Private setter that sets the counter value.
  void _setValue(int value) {
    _value = value;
    _saveValue();
  }

  /// Increments the counter value.
  void increment() {
    _setValue(value + 1);
  }

  /// Decrements the counter value.
  void decrement() {
    _setValue(value - 1);
  }

  /// Resets the counter value to zero.
  void reset() {
    _setValue(0);
  }

  //#endregion

  //#region Persistent storage

  /// Returns the persistent storage key for each counter type.
  static String _counterKey(CounterType type) => '${describeEnum(type)}_counter';

  /// Saves the counter value to persistent storage.
  Future<void> _saveValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_counterKey(type), value);
  }

  /// Loads the counter value from persistent storage.
  void loadValue(SharedPreferences prefs) {
    _value = prefs.getInt(_counterKey(type)) ?? 0;
  }

  //#endregion

  //#region Counter type, color, name

  /// The counter type.
  final CounterType type;

  /// Returns the ARGB color value of the current counter.
  Color get color => _counterColors[type]!;

  /// Returns the name of the current counter (e.g. "Red Counter").
  String get name => nameOf(type);

  /// Returns the ARGB color value for the specified counter type.
  static Color colorOf(CounterType type) => _counterColors[type]!;

  /// Returns the name of the specified counter type (e.g. "Black Counter").
  static String nameOf(CounterType type) {
    final String name = describeEnum(type);
    return '${name.substring(0, 1).toUpperCase()}${name.substring(1).toLowerCase()} Counter';
  }

  /// A map with the corresponding ARGB color value for each counter type.
  static const Map<CounterType, Color> _counterColors = {
    CounterType.monday: Colors.yellow,
    CounterType.tuesday: Colors.pink,
    CounterType.wednesday: Colors.green,
    CounterType.thursday: Colors.orange,
    CounterType.friday: Colors.blue,
    CounterType.saturday: Colors.purple,
    CounterType.sunday: Colors.red,
  };

//#endregion

}

/// Provides a map of counters for each counter type, and keeps a reference to the current counter.
class Counters {
  /// Creates a Counters instance and creates the counter instances for all counter types.
  Counters() {
    for (var type in CounterType.values) {
      _counters[type] = Counter(type);
    }
  }

  /// A map of counters for each counter type.
  final Map<CounterType, Counter> _counters = <CounterType, Counter>{};

  /// Returns the map of counters.
  Counter operator [](CounterType type) => _counters[type]!;

  /// Returns the current counter.
  Counter get current => _counters[CounterType.values[DateTime.now().weekday - 1]]!;

  /// Loads counter states from persistent storage.
  Future<void> load() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    /// Loads the values of all counters
    for (var counterType in _counters.keys) {
      _counters[counterType]?.loadValue(prefs);
    }
  }
}
