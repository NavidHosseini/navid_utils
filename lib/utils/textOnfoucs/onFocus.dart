import 'package:flutter/material.dart';

nhOnFocusText() {
  FocusManager.instance.primaryFocus?.unfocus();
}

nhIsFocus() {
  return FocusManager.instance.primaryFocus!.hasFocus;
}
