import 'package:flutter/material.dart';

class ErrorDialog extends StatelessWidget {
  final String title;
  final String? message;

  const ErrorDialog({super.key, required this.title, this.message});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: message != null ? Text('$message') : null,
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, 'OK'),
          child: Text('OK'),
        ),
      ],
    );
  }
}
