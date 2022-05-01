import 'package:flutter/material.dart'
    show
        AppBarTheme,
        BorderRadius,
        BoxDecoration,
        Brightness,
        Color,
        Colors,
        EdgeInsets,
        FloatingLabelBehavior,
        FontWeight,
        IconThemeData,
        InputDecorationTheme,
        OutlineInputBorder,
        Radius,
        TextStyle,
        ThemeData,
        VisualDensity;
import 'package:flutter/services.dart' show Brightness, SystemUiOverlayStyle;
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;
import 'package:solar_cost_calculator/helpers/constants/constants.dart'
    show kLightPrimaryColor, white;

SystemUiOverlayStyle lightUiConfig = SystemUiOverlayStyle(
  systemNavigationBarIconBrightness: Brightness.light,
  systemNavigationBarColor: const Color(0xff574844),
  statusBarIconBrightness: Brightness.light,
  statusBarBrightness: Brightness.light,
  statusBarColor: kLightPrimaryColor,
);

ThemeData lightTheme = ThemeData(
  appBarTheme: lightAppBarTheme,
  backgroundColor: white,
  fontFamily: GoogleFonts.droidSans().fontFamily,
  iconTheme: lightIconThemeData,
  inputDecorationTheme: lightInputDecorationTheme,
  scaffoldBackgroundColor: white,
  primarySwatch: Colors.brown,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

AppBarTheme lightAppBarTheme = const AppBarTheme(
  elevation: 1.0,
  backgroundColor: Colors.white,
  titleTextStyle: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  ),
);

IconThemeData lightIconThemeData = IconThemeData(color: kLightPrimaryColor);

InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
  floatingLabelBehavior: FloatingLabelBehavior.always,
  contentPadding: const EdgeInsets.fromLTRB(15.0, 5.0, 0.0, 5.0),
  enabledBorder: lightOutlineInputBorder,
  focusedBorder: lightOutlineInputBorder,
  border: lightOutlineInputBorder,
);

OutlineInputBorder lightOutlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(6.0),
  gapPadding: 10,
);

const BoxDecoration lightTabDecoration = BoxDecoration(
  borderRadius: BorderRadius.all(Radius.circular(6.0)),
);
