import 'package:flutter/material.dart';
import 'package:mecarproject/constants/colors.dart';
import 'package:mecarproject/constants/themes.dart';

class TextFormWidget extends StatelessWidget {
  const TextFormWidget({
    @required this.textController,
    @required this.focusNode,
    this.hint = 'Enter something',
    this.errorCode = '',
    this.hintStyle,
    this.textStyle = titleStyle,
    this.framesColor = borderColor,
    this.obscureText = false,
    this.textInputType = TextInputType.text,
  });

  final TextEditingController textController;
  final FocusNode focusNode;
  final String hint;
  final String errorCode;
  final TextStyle hintStyle;
  final TextStyle textStyle;
  final Color framesColor;
  final bool obscureText;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      focusNode: focusNode,
      obscureText: obscureText,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(17),
        errorText: errorCode,
        hintText: 'Enter your username',
        fillColor: Colors.white,
        border: _borderTextForm(),
        disabledBorder: _borderTextForm(),
        enabledBorder: _borderTextForm(),
        errorBorder: _borderTextForm(),
        focusedBorder: _borderTextForm(),
        focusedErrorBorder: _borderTextForm(),
        errorStyle: hintStyle != null
            ? hintStyle
            : TextStyle(fontFamily: 'Mulish', fontSize: 12, fontWeight: FontWeight.normal, fontStyle: FontStyle.normal, color: Color(0xFFE51937)),
      ),
      style: textStyle != null
          ? textStyle
          : TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.normal, fontStyle: FontStyle.normal, color: textOneColor, fontSize: 20),
      autovalidateMode: AutovalidateMode.always,
      keyboardType: textInputType,
      onChanged: (String value) {},
      onFieldSubmitted: (_) {
        focusNode.unfocus();
      },
    );
  }

  _borderTextForm() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: framesColor, width: 2),
    );
  }
}
