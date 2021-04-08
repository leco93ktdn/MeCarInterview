import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mecarproject/constants/assets.dart';
import 'package:mecarproject/constants/colors.dart';
import 'package:mecarproject/constants/themes.dart';
import 'package:mecarproject/modules/authen/bloc/authen_bloc.dart';
import 'package:mecarproject/modules/authen/bloc/authen_event.dart';
import 'package:mecarproject/modules/authen/bloc/authen_state.dart';
import 'package:mecarproject/routes/app_pages.dart';
import 'package:mecarproject/widgets/default_button.dart';
import 'package:mecarproject/widgets/header_widget.dart';

class RegisterView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegisterState();
}

class _RegisterState extends State<RegisterView> {
  AuthenBloc _getAuthenBloc;
  AuthenState state;
  final FocusNode userFocus = FocusNode();
  final TextEditingController userController = TextEditingController(text: "leco@gmail.com");
  final FocusNode passFocus = FocusNode();
  final TextEditingController passController = TextEditingController(text: "123456");

  @override
  void initState() {
    super.initState();
    _getAuthenBloc = AuthenBloc(state);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => _getAuthenBloc,
        child: SafeArea(
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
                onPressed: () => Get.offAllNamed(Routes.WELCOM),
              ),
            ),
            body: BlocBuilder<AuthenBloc, AuthenState>(builder: (context, AuthenState state) {
              return SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.all(16),
                  child: Column(
                    children: <Widget>[
                      HeaderWidget(
                        title: "Register",
                        paddingBottom: 32,
                      ),
                      _buildUserTextForm(context, ""),
                      _buildPassTextForm(context, ""),
                      DefaultButton(
                        title: "SIGN UP",
                        width: MediaQuery.of(context).size.width,
                        backgroundColor: backgroundTwoColor,
                        textStyle: titleStyle.copyWith(color: textTwoColor),
                        onPressed: () {
                          _getAuthenBloc.add(LoadingEvent());
                          _getAuthenBloc.add(RegisterEvent(userController.text, passController.text));
                        },
                      ),
                      _buildPrivacy()
                    ],
                  ),
                ),
              );
            }),
          ),
        ));
  }

  _buildPassTextForm(BuildContext context, String error) {
    return TextFormField(
      controller: passController,
      focusNode: passFocus,
      obscureText: true,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(17),
        errorText: error,
        hintText: 'Enter your password',
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
      keyboardType: TextInputType.text,
      onChanged: (String value) {},
      onFieldSubmitted: (_) {
        userFocus.unfocus();
      },
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
              style: textTwoStyle.copyWith(decoration: TextDecoration.underline),
            ),
            TextSpan(
              text: ' and ',
              style: textTwoStyle,
            ),
            TextSpan(
              text: 'Privacy Policy.',
              style: textTwoStyle.copyWith(decoration: TextDecoration.underline),
            )
          ],
        ),
      ),
    );
  }
}
