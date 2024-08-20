import 'package:flutter/material.dart';

class SnackMessage {
  static void show(context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }
}
