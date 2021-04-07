import 'package:flutter/material.dart';
import 'colors.dart';

final ThemeData appTheme = ThemeData(
  backgroundColor: backgroundOneColor,
  canvasColor: backgroundOneColor,
  primaryColor: defaultTwoColor,
  accentColor: defaultTwoColor,
  appBarTheme: AppBarTheme(
    elevation: 0,
    color: backgroundOneColor,
    centerTitle: true,
    textTheme: TextTheme(
      headline6: textTwoStyle,
    ),
    iconTheme: const IconThemeData(
      color: iconColor,
    ),
  ),
  fontFamily: 'Mulish',
  buttonTheme: const ButtonThemeData(
    buttonColor: buttonTwoColor,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: backgroundOneColor,
    selectedIconTheme: IconThemeData(color: defaultTwoColor, size: 16),
    selectedLabelStyle: textOneStyle,
    selectedItemColor: defaultTwoColor,
    showUnselectedLabels: true,
    showSelectedLabels: true,
    unselectedIconTheme: IconThemeData(color: defaultTwoColor.withOpacity(0.5), size: 16),
    unselectedItemColor: defaultTwoColor.withOpacity(0.5),
    unselectedLabelStyle: textOneStyle.copyWith(color: textOneColor.withOpacity(0.5)),
  ),
);

const TextStyle headerStyle = TextStyle(
  fontSize: 36,
  fontFamily: 'Comfortaa',
  color: textOneColor,
  letterSpacing: -0.015,
  fontWeight: FontWeight.normal,
  fontStyle: FontStyle.normal,
);

//Title
const TextStyle buttonPrimaryTextStyle = TextStyle(
  fontSize: 13,
  fontFamily: 'Roboto',
  color: textOneColor,
  letterSpacing: 0.04,
  fontWeight: FontWeight.w900,
  fontStyle: FontStyle.normal,
);


const TextStyle titleStyle = TextStyle(
  fontSize: 13,
  fontFamily: 'Roboto',
  color: textOneColor,
  letterSpacing: 0.04,
  fontWeight: FontWeight.w900,
  fontStyle: FontStyle.normal,
);

const TextStyle textOneStyle = TextStyle(
  fontSize: 13,
  fontFamily: 'Roboto',
  color: textOneColor,
  fontWeight: FontWeight.bold,
  fontStyle: FontStyle.normal,
);

const TextStyle textTwoStyle = TextStyle(
  fontSize: 13,
  fontFamily: 'Roboto',
  color: textOneColor,
  fontWeight: FontWeight.normal,
  fontStyle: FontStyle.normal,
);

