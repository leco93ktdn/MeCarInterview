import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mecarproject/constants/assets.dart';
import 'package:mecarproject/constants/colors.dart';
import 'package:mecarproject/constants/themes.dart';
import 'package:mecarproject/modules/authen/bloc/authen_bloc.dart';
import 'package:mecarproject/modules/authen/bloc/authen_event.dart';
import 'package:mecarproject/modules/authen/bloc/authen_state.dart';
import 'package:mecarproject/routes/app_pages.dart';
import 'package:mecarproject/widgets/default_button.dart';
import 'package:mecarproject/widgets/header_widget.dart';
import 'package:get/get.dart';

class LoginView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginState();
}

class _LoginState extends State<LoginView> {
  AuthenBloc _getAuthenBloc;
  AuthenState state;
  User user;
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
                onPressed: () =>
                Get.offAllNamed(Routes.WELCOM),
              ),
            ),
            body: BlocBuilder<AuthenBloc, AuthenState>(builder: (context, state) {
              if(state is CheckCurrentUserState && state.user != null) {
                user = state.user;
                userController.text = user.email;
              }
              return Stack(
                children: [
                  SingleChildScrollView(
                    child: Container(
                      margin: EdgeInsets.all(16),
                      child: Column(
                        children: <Widget>[
                          HeaderWidget(
                            title: "Log in",
                            paddingBottom: 32,
                          ),
                          _buildUserTextForm(context, ""),
                          _buildPassTextForm(context, ""),
                          DefaultButton(
                            title: "LOG IN",
                            width: MediaQuery.of(context).size.width,
                            backgroundColor: backgroundTwoColor,
                            textStyle: titleStyle.copyWith(color: textTwoColor),
                            onPressed: () {
                              _getAuthenBloc.add(LoadingEvent());
                              _getAuthenBloc.add(LoginEvent(userController.text, passController.text));
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Visibility(child: Center(child: CircularProgressIndicator()), visible: (state is AuthenLoadingState))
                ],
              );
            }),
          ),
        ));
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

  _borderTextForm() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: borderColor, width: 2),
    );
  }

  chooseState(state) {
    switch (state) {
      case AuthenLoadingState:
        return state as AuthenLoadingState;
        break;
    }
  }
}
