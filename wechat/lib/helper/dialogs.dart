import 'package:flutter/material.dart';

class Dialogs {
  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(message),
        )),
        backgroundColor: Colors.red.withOpacity(0.8),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  static void showProgressBar(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
