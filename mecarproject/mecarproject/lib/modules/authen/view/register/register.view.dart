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
import 'package:mecarproject/widgets/default_button_widget.dart';
import 'package:mecarproject/widgets/header_widget.dart';
import 'package:mecarproject/widgets/text_form_widget.dart';

class RegisterView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegisterState();
}

class _RegisterState extends State<RegisterView> {
  AuthenBloc _getAuthenBloc;
  AuthenState state;
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
                      TextFormWidget(textController: emailController, focusNode: userFocus),
                      TextFormWidget(textController: passController, focusNode: passFocus, obscureText: true),
                      DefaultButtonWidget(
                        title: "SIGN UP",
                        width: MediaQuery.of(context).size.width,
                        backgroundColor: backgroundTwoColor,
                        textStyle: titleStyle.copyWith(color: textTwoColor),
                        onPressed: () {
                          _getAuthenBloc.add(LoadingEvent());
                          _getAuthenBloc.add(RegisterEvent(emailController.text, passController.text));
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
