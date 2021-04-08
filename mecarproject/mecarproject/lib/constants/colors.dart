import 'package:flutter/material.dart';

const Color defaultOneColor = Color(0xFFFFFFFF);
const Color defaultTwoColor = Color(0xFF000000);
const Color backgroundOneColor = Color(0xFFFFFFFF);
const Color backgroundTwoColor = Color(0xFF000000);

const Color textOneColor = Color(0xFF000000);
const Color textTwoColor= Color(0xFFFFFFFF);

const Color borderColor= Color(0xFF000000);

const Color iconColor= Color(0xFF000000);
const Color iconActiveColor= Color(0xFFBDBDBD);

const Color buttonOneColor = Color(0xFFFF00D6);
const Color buttonTwoColor = Color(0xFFFF4D00);

const LinearGradient gradientButton = LinearGradient(
  colors: <Color>[buttonOneColor, buttonTwoColor],
  begin: FractionalOffset.topLeft,
  end: FractionalOffset.bottomRight,
  stops: <double>[0.0, 1.0],
  tileMode: TileMode.clamp,
);

