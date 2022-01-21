import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:up_demo_1/core/enum/notification_enum.dart';
import 'package:up_demo_1/utils/screen_util/screen_util.dart';

showNotification(BuildContext context, {required String message, Not type = Not.success}) {
  Flushbar(
    title: type.str(),
    message: message,
    duration: const Duration(seconds: 2),
    flushbarPosition: FlushbarPosition.TOP,
    margin: EdgeInsets.symmetric(horizontal: 8.w),
    borderRadius: BorderRadius.circular(8.r),
    blockBackgroundInteraction: false,
  ).show(context);
}
