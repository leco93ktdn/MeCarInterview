import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mecarproject/constants/colors.dart';
import 'package:mecarproject/constants/themes.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    @required this.title = '',
    this.paddingTop = 0,
    this.paddingBottom = 0,
    this.paddingLeft = 0,
    this.paddingRight = 0,
    this.textStyle = headerStyle,
  });

  final String title;
  final double paddingTop;
  final double paddingBottom;
  final double paddingLeft;
  final double paddingRight;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Container(
        padding: EdgeInsets.fromLTRB(
            paddingLeft, paddingTop, paddingRight, paddingBottom),
        child: Text(title, style: textStyle),
      )
    ]);
  }
}
