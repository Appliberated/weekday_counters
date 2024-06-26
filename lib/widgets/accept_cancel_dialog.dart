// Copyright 2020-2024 Appliberated (https://appliberated.com). All rights reserved.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// @author TechAurelian <dev@techaurelian.com> (https://techaurelian.com)

import 'package:flutter/material.dart';

/// Displays a Material dialog with "accept" and "cancel" buttons.
void showAcceptCancelDialog(
  BuildContext context,
  String title,
  String message,
  String acceptButton,
  String cancelButton,
  VoidCallback onAccept,
) {
  showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(foregroundColor: Colors.black),
              child: Text(cancelButton.toUpperCase()),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(foregroundColor: Colors.black),
              child: Text(acceptButton.toUpperCase()),
              onPressed: () {
                onAccept();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      });
}
