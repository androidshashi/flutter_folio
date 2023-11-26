// ignore_for_file: constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_folio/constants/app_color.dart';

void showSnackBar(
    {required BuildContext context,
    required String content,
    required bool success}) {
  if (!context.mounted) return;
  final snackBar = SnackBar(
    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
    ),
    content: Text(
      content,
      style: const TextStyle(color: Colors.white),
    ),
    backgroundColor: success ? AppColor.primary : Colors.black54,
    duration: const Duration(seconds: 2),
  );

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void debugLog(String? text) {
  if (kDebugMode) {
    debugPrint("##################\n$text\n>>>>>>>>>>>>>>>>>");
  }
}

void hideKeyBoard() {
  FocusManager.instance.primaryFocus?.unfocus();
}
