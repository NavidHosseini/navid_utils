import 'package:easy_debounce/easy_debounce.dart';

debounce(String tag, void Function() onExecute,
    {Duration duration = const Duration(milliseconds: 500)}) {
  EasyDebounce.debounce(tag, const Duration(milliseconds: 500), onExecute);
}
