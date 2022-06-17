import 'package:flutter/material.dart';

onFocusText() {
  FocusManager.instance.primaryFocus?.unfocus();
}

isFocus() {
  return FocusManager.instance.primaryFocus!.hasFocus;
}
