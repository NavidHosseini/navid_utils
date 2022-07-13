import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:flutter/material.dart';

Widget nhExitApp2PressBack(
    {child,
    required bool condition,
    Function? onBack,

    /// default is "برای خارج شدن دوباره بازگشت را بزنید"
    String message = "برای خارج شدن دوباره بازگشت را بزنید",
    TextStyle textStyle = const TextStyle(fontSize: 14, color: Colors.white),
    Color background = const Color(0xAA000000),
    double backgroundRadius = 20}) {
  return condition
      ? containerWithCondition(onBack, child)
      : DoubleBack(
          message: message,
          child: child,
          condition: true,
          textStyle: textStyle,
          background: background,
          backgroundRadius: backgroundRadius,
        );
}

Widget containerWithCondition(Function? onBack, child) {
  Future<bool> _willPopScopeCall() async {
    onBack!();
    return false;
  }

  return WillPopScope(child: child, onWillPop: _willPopScopeCall);
}
