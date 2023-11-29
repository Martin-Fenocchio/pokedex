import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokedex/utils/responsive/responsive.dart';

class ThemeConfig {
  ThemeData getTheme() {
    const Color colorText = Color(0xff1D1D1D);
    const Color primary = Color(0xffDC0A2D);

    final ThemeData getTheme = ThemeData(
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          systemNavigationBarColor: primary,
          systemNavigationBarIconBrightness: Brightness.light,
          statusBarColor: primary,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: primary,
      ),
      fontFamily: 'Poppins',
      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: colorText, fontWeight: FontWeight.w300),
      ),
      colorScheme: const ColorScheme.light(
        primary: primary,
      ),
    );

    return getTheme;
  }
}

Color greyTextColor = const Color(0xffA3A3A3);

Color Function(BuildContext) colorPmy =
    (BuildContext context) => Theme.of(context).colorScheme.primary;

double fontSizeParg = 18;

TextStyle Function(BuildContext, {bool useColorTry}) styleHeadSection =
    (BuildContext context, {bool useColorTry = false}) => TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 5.w(context),
        );
TextStyle Function(BuildContext) styleTitleSection = (
  BuildContext context,
) =>
    const TextStyle(
      fontSize: 18,
      color: Colors.black,
      fontWeight: FontWeight.w500,
    );

TextStyle Function(BuildContext, {bool useColorTry}) styleSubHead =
    (BuildContext context, {bool useColorTry = false}) => TextStyle(
          color: colorPmy(context),
          fontWeight: FontWeight.w700,
          fontFamily: 'Urbanist',
          fontSize: 4.w(context),
        );

TextStyle Function(BuildContext) styleParag = (context) => TextStyle(
      color: greyTextColor,
      fontSize: fontSizeParg,
    );
