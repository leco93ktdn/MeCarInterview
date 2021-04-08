import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mecarproject/constants/assets.dart';
import 'package:mecarproject/constants/colors.dart';
import 'package:mecarproject/constants/themes.dart';
import 'package:mecarproject/widgets/default_button_widget.dart';
import 'package:mecarproject/widgets/header_widget.dart';

class HomeView extends StatelessWidget {
  final FocusNode userFocus = FocusNode();
  final TextEditingController emailController = TextEditingController();
  final FocusNode passFocus = FocusNode();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                HeaderWidget(
                  title: "Discover",
                  paddingBottom: 32,
                  paddingTop: 44,
                ),
                _buildNewPost(context),
                _buildAllPost(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildNewPost(BuildContext context) {
    return Column(
      children: [
        HeaderWidget(
          title: "What’s new today".toUpperCase(),
          paddingBottom: 24,
          textStyle: titleStyle,
        ),
        _buildImage(context),
        _buildAccount(),
      ],
    );
  }

  _buildImage(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Image.asset(
        AssetsPNG.img1,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.contain,
      ),
    );
  }

  _buildAccount() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipOval(
          child: Container(
            height: 28,
            width: 28,
            margin: EdgeInsets.only(right: 8),
            child: Image.asset(
              AssetsPNG.avatar2,
              width: 28.0,
              height: 28.0,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text(
                "Ridhwan Nordin",
                style: textOneStyle,
              ),
            ),
            Container(
              child: Text(
                "@ridzjcob",
                style: textTwoStyle,
                textAlign: TextAlign.left,
              ),
            )
          ],
        )
      ],
    );
  }

  _buildAllPost(BuildContext context) {
    return Column(
      children: [
        HeaderWidget(
          title: "Browse all".toUpperCase(),
          paddingBottom: 24,
          paddingTop: 48,
          textStyle: titleStyle,
        ),
        _buildAllImage(context),
        DefaultButtonWidget(
            title: "SEE MORE", width: MediaQuery.of(context).size.width),
        Container(height: 80)
      ],
    );
  }

  _buildAllImage(BuildContext context) {
    List<String> images = <String>[];
    for (int i = 1; i < 7; i++) {
      images.add("assets/png/img" + i.toString() + ".png");
    }

    return new StaggeredGridView.countBuilder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 4,
      itemCount: images.length,
      itemBuilder: (BuildContext context, int index) => new Container(
        child: new Image.asset(
          images[index],
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
      ),
      staggeredTileBuilder: (_) => StaggeredTile.fit(2),
      mainAxisSpacing: 9.0,
      crossAxisSpacing: 9.0,
    );
  }
}
