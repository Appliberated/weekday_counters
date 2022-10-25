// Copyright 2020-2022 TechAurelian. All rights reserved.
// Use of this source code is governed by an MIT-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import 'common/app_strings.dart';
import 'screens/home.dart';

void main() {
  runApp(const CountersApp());
}

/// The app widget.
class CountersApp extends StatelessWidget {
  const CountersApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Colors.white,
          onPrimary: Colors.black,
          secondary: Colors.white,
          onSecondary: Colors.black,
          onSurface: Colors.black,
        ),
      ),
      // theme: ThemeData(
      //   primarySwatch: Colors.white.createMaterialColor(),
      //   buttonTheme: ButtonThemeData(
      //     colorScheme: ColorScheme.fromSwatch(
      //       primarySwatch: Colors.black.createMaterialColor(),
      //     ),
      //   ),
      //   visualDensity: VisualDensity.adaptivePlatformDensity,
      //   typography: Typography.material2018(),
      // ),
      home: const HomeScreen(),
    );
  }
}
