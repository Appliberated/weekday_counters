// Copyright 2020-2025 Appliberated. All rights reserved.
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://www.appliberated.com/weekdaycounters/license/.

import 'package:flutter/material.dart';

/// A list tile that contains a leading circular color swatch and some text.
class ColorListTile extends StatelessWidget {
  /// Creates a color list tile.
  ///
  /// The [color] and [title] parameters must not be null.
  const ColorListTile({
    super.key,
    required this.color,
    required this.title,
    required this.subtitle,
    this.enabled = true,
    this.selected = false,
    this.onTap,
  });

  /// The ARGB color value to fill the circular color swatch.
  final Color color;

  /// The primary text content of the color list tile.
  final String title;

  /// The additional text content displayed below the title.
  final String subtitle;

  /// This color list is currently enabled and interactive.
  final bool enabled;

  /// This color list tile is currently selected, and will be rendered with a grey background.
  final bool selected;

  /// Called when the user taps this list tile.
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected ? Colors.black12 : null,
      child: ListTile(
        selected: selected,
        enabled: enabled,
        leading: _ColorFilledCircle(
          color: color,
          border: color == Colors.white ? Border.all() : null,
        ),
        title: Text(title),
        subtitle: Text(subtitle),
        onTap: onTap,
      ),
    );
  }
}

/// A circular widget filled with a specified [Color].
class _ColorFilledCircle extends StatelessWidget {
  /// Creates a circular widget filled with the specified [Color].
  ///
  /// The [color] parameter must not be null.
  // ignore: unused_element_parameter
  const _ColorFilledCircle({super.key, required this.color, this.diameter = 40.0, this.border});

  /// The color with which to fill the circle.
  final Color color;

  /// The size of the circle, expressed as the diameter.
  final double diameter;

  /// A border to draw above the background [color].
  final BoxBorder? border;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: diameter,
      height: diameter,
      decoration: BoxDecoration(color: color, border: border, shape: BoxShape.circle),
    );
  }
}
