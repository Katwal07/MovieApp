import 'package:flutter/material.dart';

class AppHelperFunction {
  static void showSnackBar(String message, BuildContext context) {
    final snackBar = SnackBar(
      content: Text(message),
      behavior: SnackBarBehavior.floating,
      duration: const Duration(milliseconds: 80),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.all(16),
      backgroundColor: const Color.fromARGB(255, 23, 21, 21),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}