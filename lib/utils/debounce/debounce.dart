import 'package:easy_debounce/easy_debounce.dart';

nhEasyDebounce({
  ///Will delay the execution of [onExecute] with the given [duration]. If another call to debounce() with the same [tag] happens within this duration, the first call will be cancelled and the debouncer will start waiting for another [duration] before executing [onExecute]
  required void Function() onExecute,

  ///is any arbitrary String, and is used to identify this particular debounce operation in subsequent calls to [debounce()] or [cancel()]
  required String tag,

  ///If [duration] is Duration.zero, [onExecute] will be executed immediately, i.e. synchronously
  Duration duration = const Duration(milliseconds: 500),
}) {
  EasyDebounce.debounce(tag, duration, onExecute);
}
