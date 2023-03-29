import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';

abstract class UITheme {
  static get appTheme {
    // TODO: Verify font licenses

    return ThemeData(
      useMaterial3: true,
      splashFactory: InkSplash.splashFactory,
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: UIColor.spanishGray,
        selectionColor: UIColor.jeansBlue,
        selectionHandleColor: UIColor.unitedNationsBlue,
      ),
      colorScheme: const ColorScheme.light(
        primary: UIColor.white,
        secondary: UIColor.white,
        onPrimary: UIColor.white,
        onSecondary: UIColor.white,
      ),
      fontFamily: GoogleFonts.poppins().fontFamily,
      appBarTheme: AppBarTheme(
        surfaceTintColor: UIColor.white,
        centerTitle: true,
        elevation: 0,
        titleTextStyle: TextStyle(fontFamily: GoogleFonts.poppins().fontFamily),
        iconTheme: const IconThemeData(
          color: UIColor.black,
        ),
        backgroundColor: UIColor.white,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        elevation: 5,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
      ),
      cupertinoOverrideTheme: CupertinoThemeData(
        textTheme: CupertinoTextThemeData(
          textStyle: GoogleFonts.poppins(),
          tabLabelTextStyle: GoogleFonts.poppins(),
        ),
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: SharedAxisPageTransitionsBuilder(
            transitionType: SharedAxisTransitionType.vertical,
          ),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder()
        },
      ),
    );
  }
}
