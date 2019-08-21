import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

ToastFuture showErrorToast(String message) {
  return showToast(
    message,
    position: ToastPosition.bottom,
    textPadding: EdgeInsets.symmetric(
      horizontal: 16.0,
      vertical: 12.0,
    ),
    textStyle: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
    backgroundColor: Colors.red,
    duration: Duration(seconds: 5),
  );
}
