import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:another_flushbar/flushbar.dart';

class Utils {
  static showtoast(String message) {
    Fluttertoast.showToast(msg: message);
  }

  static showflushbar(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        flushbarPosition: FlushbarPosition.TOP,
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.red,
        margin: const EdgeInsets.all(10),
        borderRadius: BorderRadius.circular(15),
        message: message,
        icon: const Icon(
          Icons.info,
        ),
      )..show(
          context,
        ),
    );
  }

  static shiftfocus({required FocusNode node, required BuildContext context}) {
    FocusScope.of(context).requestFocus(node);
  }
}
