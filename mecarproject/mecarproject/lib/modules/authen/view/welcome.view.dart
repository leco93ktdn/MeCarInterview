import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mecarproject/constants/assets.dart';
import 'package:mecarproject/constants/colors.dart';
import 'package:mecarproject/constants/themes.dart';
import 'package:mecarproject/modules/authen/bloc/authen_bloc.dart';
import 'package:mecarproject/modules/authen/bloc/authen_event.dart';
import 'package:mecarproject/modules/authen/bloc/authen_state.dart';
import 'package:mecarproject/routes/app_pages.dart';
import 'package:mecarproject/widgets/default_button.dart';

class WelcomeView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WelcomeState();
}

class _WelcomeState extends State<WelcomeView> {
  AuthenBloc _getAuthenBloc;
  AuthenState state;
  String userName = 'Unknown';
  String email = 'Unknown';
  User user;

  @override
  void initState() {
    super.initState();
    _getAuthenBloc = AuthenBloc(state);
    initInfo();
  }

  Future<void> initInfo() async {
    await _getAuthenBloc.add(CheckCurrentUserEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => _getAuthenBloc,
        child: SafeArea(
          top: false,
          bottom: false,
          child: Scaffold(
            body: BlocBuilder<AuthenBloc, AuthenState>(builder: (context, AuthenState state) {
              if (state is CheckCurrentUserState && state.user != null) {
                user = state.user;
                userName = user.displayName??"Unknow";
                email = user.email??"Unknow";
              }
              return Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 105),
                    height: double.infinity,
                    width: double.infinity,
                    decoration: new BoxDecoration(
                        image: new DecorationImage(
                      image: new AssetImage(AssetsPNG.background),
                      fit: BoxFit.fill,
                    )),
                    child: Stack(
                      children: [
                        _buildLogo(),
                        _buildAccount(),
                      ],
                    ),
                  ),
                  _buildButton(context)
                ],
              );
            }),
          ),
        ));
  }

  _buildAccount() {
    return Positioned(
        bottom: 20,
        left: 16,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipOval(
              child: Container(
                height: 28,
                width: 28,
                margin: EdgeInsets.only(right: 8),
                child: !user.isNull
                    ? Image.asset(AssetsPNG.avatar, width: 28.0, height: 28.0, fit: BoxFit.contain)
                    : SvgPicture.asset(AssetsSVG.ic_account, width: 28.0, height: 28.0, fit: BoxFit.contain),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    userName,
                    style: textOneStyle,
                  ),
                ),
                Container(
                  child: Text(
                    email,
                    style: textTwoStyle,
                  ),
                )
              ],
            )
          ],
        ));
  }

  _buildLogo() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 84),
      child: Center(
        child: AspectRatio(
          aspectRatio: 3.8 / 1,
          child: Image.asset(
            AssetsPNG.logo,
            fit: BoxFit.fill,
            width: double.infinity,
          ),
        ),
      ),
    );
  }

  _buildButton(BuildContext context) {
    return Positioned(
        left: 0,
        right: 0,
        bottom: 33,
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 16),
              child: DefaultButton(
                width: MediaQuery.of(context).size.width / 2 - 22,
                title: "LOG IN",
                onPressed: () {
                  Get.toNamed(Routes.LOGIN);
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 16),
              child: DefaultButton(
                width: MediaQuery.of(context).size.width / 2 - 22,
                title: "REGISTER",
                backgroundColor: backgroundTwoColor,
                textStyle: titleStyle.copyWith(color: textTwoColor),
                onPressed: () {
                  Get.toNamed(Routes.REGISTER);
                },
              ),
            ),
          ],
        ));
  }
}

//     class WelcomeView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     AuthenState state;
//     AuthenBloc _getAuthenBloc = AuthenBloc(state);
//     return SafeArea(
//       top: false,
//       bottom: false,
//       child: Scaffold(
//         body: Stack(
//           children: <Widget>[
//             Container(
//               margin: EdgeInsets.only(bottom: 105),
//               height: double.infinity,
//               width: double.infinity,
//               decoration: new BoxDecoration(
//                   image: new DecorationImage(
//                 image: new AssetImage(AssetsPNG.background),
//                 fit: BoxFit.fill,
//               )),
//               child: Stack(
//                 children: [
//                   _buildLogo(),
//                   _buildAccount(),
//                 ],
//               ),
//             ),
//             _buildButton(context)
//           ],
//         ),
//       ),
//     );
//   }
// }
