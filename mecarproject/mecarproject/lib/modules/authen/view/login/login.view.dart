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
import 'package:mecarproject/widgets/default_button_widget.dart';
import 'package:mecarproject/widgets/header_widget.dart';
import 'package:get/get.dart';
import 'package:mecarproject/widgets/text_form_widget.dart';

class LoginView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginState();
}

class _LoginState extends State<LoginView> {
  AuthenBloc _getAuthenBloc;
  AuthenState state;
  User user;
  final FocusNode userFocus = FocusNode();
  final TextEditingController emailController = TextEditingController();
  final FocusNode passFocus = FocusNode();
  final TextEditingController passController = TextEditingController();

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
            body: BlocBuilder<AuthenBloc, AuthenState>(builder: (context, state) {
              if (state is CheckCurrentUserState && state.user != null) {
                user = state.user;
                emailController.text = user.email;
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
                          TextFormWidget(textController: emailController, focusNode: userFocus),
                          TextFormWidget(textController: passController, focusNode: passFocus, obscureText: true),
                          DefaultButtonWidget(
                            title: "LOG IN",
                            width: MediaQuery.of(context).size.width,
                            backgroundColor: backgroundTwoColor,
                            textStyle: titleStyle.copyWith(color: textTwoColor),
                            onPressed: () {
                              _getAuthenBloc.add(LoadingEvent());
                              _getAuthenBloc.add(LoginEvent(emailController.text, passController.text));
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
}
