import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

showFlushBar(String text, BuildContext context, [type]) {
  Flushbar(
    flushbarPosition: FlushbarPosition.TOP,
    flushbarStyle: FlushbarStyle.GROUNDED,
    backgroundColor: Colors.red[600],
    message: text,
    icon: Icon(
      Icons.warning,
      size: 28.0,
      color: Colors.white,
    ),
    duration: Duration(seconds: 5),
    animationDuration: Duration(milliseconds: 400),
    // leftBarIndicatorColor: Colors.red[400],
  )..show(context);
}
