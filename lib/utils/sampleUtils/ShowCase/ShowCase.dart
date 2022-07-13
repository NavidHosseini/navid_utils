// import 'package:flutter/material.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:showcaseview/showcaseview.dart';
// import 'package:soksok/src/utils/templateUtils/resources/flix_colors.dart';

// // ignore: must_be_immutable
// class ShowCaseCustom extends StatelessWidget {
//   final GlobalKey keyShowCase;
//   final String title;
//   final String description;
//   final Widget child;
//   EdgeInsets? padding;

//   ShowCaseCustom({
//     Key? key,
//     this.padding,
//     required this.keyShowCase,
//     required this.title,
//     required this.description,
//     required this.child,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Showcase(
//       onTargetClick: () {
//         //print("target");
//       },
//       disposeOnTap: false,
//       overlayPadding: padding ?? EdgeInsets.zero,
//       key: keyShowCase,
//       title: title,
//       description: description,
//       showcaseBackgroundColor: muvi_appBackground,
//       textColor: Colors.white,
//       shapeBorder: const CircleBorder(),
//       child: child,
//     );
//   }
// }

// startShowCase({
//   required BuildContext context,
//   required List<GlobalKey<State<StatefulWidget>>> keys,
//   required String witchPage,
// }) {
//   GetStorage AsyncStorage = GetStorage();

//   if (AsyncStorage.hasData("showCaseScreen")) {
//     List showCaseScreen = AsyncStorage.read("showCaseScreen");
//     bool isShowBefore = showCaseScreen.contains(witchPage);
//     if (isShowBefore == false) {
//       showCaseScreen.add(witchPage);
//       AsyncStorage.write("showCaseScreen", showCaseScreen);
//       WidgetsBinding.instance.addPostFrameCallback(
//         (_) => ShowCaseWidget.of(context)!.startShowCase(keys),
//       );
//     } else {
//       //print("this page $witchPage viewed");
//     }
//   } else {
//     AsyncStorage.write("showCaseScreen", [witchPage]);
//     WidgetsBinding.instance.addPostFrameCallback(
//       (_) => ShowCaseWidget.of(context)!.startShowCase(keys),
//     );
//   }
// }
