import 'package:another_flushbar/flushbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void showSnackBarError(
    {required BuildContext context,
    required String message,
    required bool isError}) {
  Flushbar(
    duration: const Duration(seconds: 2),
    icon: Icon(
      !isError ? Icons.check_circle : Icons.error,
      size: 32,
      color: Colors.white,
    ),
    shouldIconPulse: true,
    title: isError ? "error".tr() : "success".tr(),
    message: message,
    flushbarPosition: FlushbarPosition.TOP,
    borderRadius: BorderRadius.circular(16),
    margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
    barBlur: 20,
    backgroundColor: const Color(0xff00FF8A).withOpacity(0.5),
    dismissDirection: FlushbarDismissDirection.VERTICAL,
  ).show(context);
}
