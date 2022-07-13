// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';


// class Themes {
//   static final themelight = ThemeData(
//     scaffoldBackgroundColor: whiteColor,
//     primaryColor: appColorPrimary,
//     primaryColorDark: appColorPrimary,
//     errorColor: Colors.red,
//     hoverColor: Colors.white54,
//     dividerColor: viewLineColor,
//     fontFamily: 'Sans',
//     appBarTheme: const AppBarTheme(
//       color: appLayout_background,
//       iconTheme: IconThemeData(color: textPrimaryColor),
//       systemOverlayStyle:
//           SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark),
//     ),
//     textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.black),
//     colorScheme: const ColorScheme.light(
//         primary: appColorPrimary, primaryVariant: appColorPrimary),
//     cardTheme: const CardTheme(color: Colors.white),
//     cardColor: Colors.white,
//     iconTheme: const IconThemeData(color: textPrimaryColor),
//     bottomSheetTheme: const BottomSheetThemeData(backgroundColor: whiteColor),
//     textTheme: const TextTheme(
//       button: TextStyle(color: appColorPrimary),
//       headline6: TextStyle(color: textPrimaryColor),
//       subtitle2: TextStyle(color: textSecondaryColor),
//     ),
//     visualDensity: VisualDensity.adaptivePlatformDensity,
//   ).copyWith(
//     pageTransitionsTheme: const PageTransitionsTheme(
//         builders: <TargetPlatform, PageTransitionsBuilder>{
//           TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
//           TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
//           TargetPlatform.linux: OpenUpwardsPageTransitionsBuilder(),
//           TargetPlatform.macOS: OpenUpwardsPageTransitionsBuilder(),
//         }),
//   );

//   static final themedark = ThemeData(
//     brightness: Brightness.dark,
//     primaryColor: const Color(0xFF00a693),
//     backgroundColor: const Color(0xFF200C41),
//     scaffoldBackgroundColor: Color(0xFF200C41),
//     colorScheme: const ColorScheme(
//       primary: Color(0xFF00a693),
//       onPrimary: Colors.white, //color of buttom
//       primaryVariant: Colors.green,
//       background: Colors.yellow,
//       onBackground: Colors.red,
//       secondary: Color(0xFF0c1d37),
//       onSecondary: Color(0xFF0c1d37),
//       secondaryVariant: Color(0xFF0c1d37),
//       error: Color(0xFF0c1d37),
//       onError: Color(0xFF0c1d37),
//       surface: Color(0xFF0c1d37),
//       onSurface: Color(0xFF0c1d37),
//       brightness: Brightness.dark,
//     ),
//     // Define the default font family.
//     fontFamily: 'Sans',
//     //   textTheme: const TextTheme(
//     //   bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
//     // ),
//   );
// }
