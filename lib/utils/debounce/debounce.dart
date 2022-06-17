import 'package:easy_debounce/easy_debounce.dart';

easyDebounce(String tag, void Function() onExecute,
    {Duration duration = const Duration(milliseconds: 500)}) {
  EasyDebounce.debounce(tag, const Duration(milliseconds: 500), onExecute);
}
