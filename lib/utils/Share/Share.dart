import 'package:get/utils.dart';
import 'package:share_plus/share_plus.dart';

void share(String movieName) {
  String textShare =
      '${"movie".tr} "${movieName}" ${"watch in application soksok".tr} https://sok-sok.com';
  Share.share(
    textShare,
  );
}
