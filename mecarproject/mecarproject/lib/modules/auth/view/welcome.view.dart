import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mecarproject/constants/assets.dart';
import 'package:mecarproject/constants/colors.dart';
import 'package:mecarproject/constants/themes.dart';
import 'package:mecarproject/routes/app_pages.dart';
import 'package:mecarproject/widgets/default_button.dart';

class WelcomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        body: Stack(
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
        ),
      ),
    );
  }
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
              child: Image.asset(
                AssetsPNG.avatar,
                width: 28.0,
                height: 28.0,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  "Pawel Czerwinski",
                  style: textOneStyle,
                ),
              ),
              Container(
                child: Text(
                  "@pawel_czerwinski",
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
