import 'package:flutter/material.dart';

void demoNotice(BuildContext context, String message) {
  ScaffoldMessenger.of(
    context,
  ).showSnackBar(SnackBar(content: Text('$message. Demostración académica.')));
}
