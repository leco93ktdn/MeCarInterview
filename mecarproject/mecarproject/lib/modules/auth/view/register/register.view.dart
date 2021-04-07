import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mecarproject/constants/assets.dart';
import 'package:mecarproject/constants/colors.dart';
import 'package:mecarproject/constants/themes.dart';
import 'package:mecarproject/routes/app_pages.dart';
import 'package:mecarproject/widgets/default_button.dart';
import 'package:mecarproject/widgets/header_widget.dart';

class RegisterView extends StatelessWidget {
  final FocusNode userFocus = FocusNode();
  final TextEditingController userController = TextEditingController();
  final FocusNode passFocus = FocusNode();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: SvgPicture.asset(
              AssetsSVG.ic_previous,
              width: 13,
              height: 13,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                HeaderWidget(
                  title: "Register",
                  paddingBottom: 32,
                ),
                _buildUserTextForm(context, ""),
                DefaultButton(
                  title: "SIGN UP",
                  width: MediaQuery.of(context).size.width,
                  backgroundColor: backgroundTwoColor,
                  textStyle: titleStyle.copyWith(color: textTwoColor),
                  onPressed: () {
                    Get.toNamed(Routes.LOGIN);},
                ),
                _buildPrivacy()
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildUserTextForm(BuildContext context, String error) {
    return TextFormField(
      controller: userController,
      focusNode: userFocus,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(17),
        errorText: error,
        hintText: 'Enter your username',
        fillColor: Colors.white,
        border: _borderTextForm(),
        disabledBorder: _borderTextForm(),
        enabledBorder: _borderTextForm(),
        errorBorder: _borderTextForm(),
        focusedBorder: _borderTextForm(),
        focusedErrorBorder: _borderTextForm(),
        errorStyle: TextStyle(
          fontFamily: 'Mulish',
          fontSize: 12,
          fontWeight: FontWeight.normal,
          fontStyle: FontStyle.normal,
          color: Color(0xFFE51937),
        ),
      ),
      style: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
        color: textOneColor,
        fontSize: 20,
      ),
      autovalidateMode: AutovalidateMode.always,
      keyboardType: TextInputType.emailAddress,
      onChanged: (String value) {},
      onFieldSubmitted: (_) {
        userFocus.unfocus();
      },
    );
  }

  _borderTextForm() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: borderColor, width: 2),
    );
  }

  _buildPrivacy() {
    return Container(
      padding: EdgeInsets.only(top: 32),
      child: RichText(
        textAlign: TextAlign.left,
        text: TextSpan(
          children: <InlineSpan>[
            TextSpan(
              text: 'By signing up, you agree to Photo’s ',
              style: textTwoStyle,
            ),
            TextSpan(
              recognizer: TapGestureRecognizer()..onTap = () {},
              text: 'Terms of Service',
              style:
                  textTwoStyle.copyWith(decoration: TextDecoration.underline),
            ),
            TextSpan(
              text: ' and ',
              style: textTwoStyle,
            ),
            TextSpan(
              text: 'Privacy Policy.',
              style:
                  textTwoStyle.copyWith(decoration: TextDecoration.underline),
            )
          ],
        ),
      ),
    );
  }
}