// Copyright 2020 Appliberated. All rights reserved.
// Use of this source code is governed by an MIT-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:weekday_counters/utils/utils.dart';

/// A widget that displays a centered integer counter value, filled with a specified color.
class CounterDisplay extends StatelessWidget {
  /// Creates a counter display widget.
  const CounterDisplay({
    Key key,
    @required this.value,
    @required this.color,
    this.isPortrait = true,
  })  : assert(value != null),
        assert(color != null),
        assert(isPortrait != null),
        super(key: key);

  /// The color with which to fill the counter container.
  final Color color;

  /// The value of the counter.
  final int value;

  /// Are we in portrait "mode"?
  final bool isPortrait;

  @override
  Widget build(BuildContext context) {
    final TextStyle counterStyle =
        isPortrait ? Theme.of(context).textTheme.headline1 : Theme.of(context).textTheme.headline2;

    return Container(
      alignment: Alignment.center,
      color: color,
      padding: const EdgeInsets.all(16.0),
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: Text(
          toDecimalString(context, value),
          overflow: TextOverflow.ellipsis,
          style: counterStyle.copyWith(
            color: color.contrastOf(),
          ),
        ),
      ),
    );
  }
}
