// Copyright 2020-2024 Hellogramming. All rights reserved.
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://hellogramming.com/weekdaycounters/license/.

import 'package:flutter/material.dart';

import 'common/strings.dart' as strings;
import 'screens/home_screen.dart';

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
      title: strings.appName,

      // A black and white theme to go with the app's colored counters
      theme: ThemeData.from(
        colorScheme: ColorScheme.light(
          primary: Colors.black,
          surface: Colors.white,
          onSurface: Colors.black,
          surfaceTint: Colors.white,
          primaryContainer: Colors.white,
          onPrimaryContainer: Colors.black,
          outlineVariant: Colors.grey.shade200,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
