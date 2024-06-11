import 'package:academy/src/core/resources/app_constants.dart';
import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData lightThemeData() {
    return ThemeData(
      useMaterial3: true,
      fontFamily: AppConstants.isFa? 'Vazir' : 'Poppins',
      colorSchemeSeed: Colors.blue,
      // appBarTheme: const AppBarTheme(color: Colors.green, shadowColor: Colors.red,
      //     elevation: 5, foregroundColor: Colors.white),
    );
  }

  static ThemeData darkThemeData() {
    return ThemeData(
      fontFamily: AppConstants.isFa? 'Vazir' : 'Poppins',
      useMaterial3: true,
      colorSchemeSeed: Colors.blue,
      brightness: Brightness.dark,
      // textTheme:
      // elevatedButtonTheme:
      // appBarTheme: const AppBarTheme(color: Colors.green, shadowColor: Colors.red,
      //     elevation: 5, foregroundColor: Colors.white),
    );
  }

  TextTheme textTheme() => const TextTheme(
      // displayLarge: const TextStyle(
      //   fontSize: 72,
      //   fontWeight: FontWeight.bold,
      // ),
      // titleLarge: GoogleFonts.nunito(
      //   fontWeight: FontWeight.bold,
      //   color: Colors.white,
      // ),
      // titleMedium: GoogleFonts.kanit(
      //   fontWeight: FontWeight.bold,
      //   color: Colors.black,
      // ),
      // titleSmall: GoogleFonts.kanit(
      //   fontWeight: FontWeight.bold,
      //   color: Colors.black,
      // ),
      // bodyMedium: GoogleFonts.dmSans(
      //   color: Colors.black,
      // ),
      );

// ElevatedButtonThemeData elevatedButtonTheme() => ElevatedButtonThemeData(
//     style: ButtonStyle(
//         elevation:
//             MaterialStateProperty.resolveWith((Set<MaterialState> states) {
//           if (states.contains(MaterialState.hovered)) {
//             return 5.0;
//           } else {
//             return 3.0;
//           }
//         }),
//         backgroundColor:
//             MaterialStateProperty.resolveWith((Set<MaterialState> states) {
//           if (states.contains(MaterialState.hovered)) {
//             return Colors.white;
//           } else {
//             return Colors.green;
//           }
//         }),
//         shadowColor:
//             MaterialStateProperty.all<Color>(Colors.lightGreenAccent),
//         textStyle: MaterialStateProperty.all(
//             GoogleFonts.prompt(fontWeight: FontWeight.w600)),
//         foregroundColor:
//             MaterialStateProperty.resolveWith((Set<MaterialState> states) {
//           if (states.contains(MaterialState.hovered)) {
//             return Colors.green;
//           } else {
//             return Colors.white;
//           }
//         })));
}
