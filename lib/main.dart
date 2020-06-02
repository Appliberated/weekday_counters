// Copyright 2020 Appliberated. All rights reserved.
// Use of this source code is governed by an MIT-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:weekday_counters/screens/home.dart';
import 'package:weekday_counters/utils/utils.dart';

import 'common/app_strings.dart';

void main() => runApp(CountersApp());

/// The app widget.
class CountersApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme: ThemeData(
        primarySwatch: Colors.white.createMaterialColor(),
        buttonTheme: ButtonThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.black.createMaterialColor(),
          ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        typography: Typography.material2018(),
      ),
      home: HomeScreen(),
    );
  }
}
