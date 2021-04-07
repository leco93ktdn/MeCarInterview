import 'package:flutter/material.dart';
import 'package:mecarproject/constants/colors.dart';
import 'package:mecarproject/constants/themes.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    this.onPressed,
    @required this.title = '',
    this.height = 52,
    this.width = 0,
    this.backgroundColor = backgroundOneColor,
    this.textStyle = titleStyle,
  });

  final Function() onPressed;
  final String title;
  final double height;
  final double width;
  final Color backgroundColor;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: borderColor, width: 2),
            color: backgroundColor),
        child: Center(
          child: Text(
            title,
            style: textStyle,
          ),
        ),
      ),
    );
  }
}
