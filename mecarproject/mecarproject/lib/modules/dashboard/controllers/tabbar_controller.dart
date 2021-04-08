import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:mecarproject/constants/colors.dart';
import '../../../constants/assets.dart';
import '../models/fancy_tab_item.model.dart';
import '../views/dashboard.view.dart';

class TabbarController extends GetxController with WidgetsBindingObserver {
  TabType tabType = TabType.home;
  bool isKeyboardVisible = false;
  DateTime _backButtonOnPressed;

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    final double bottomInset = WidgetsBinding.instance.window.viewInsets.bottom;
    final bool checkKeyboard = bottomInset > 0.0;
    if (checkKeyboard != isKeyboardVisible) {
      isKeyboardVisible = checkKeyboard;
      update();
    }
  }

  final List<FancyTabItemModel> tabs = <FancyTabItemModel>[
    FancyTabItemModel(AssetsSVG.ic_home, TabType.home),
    FancyTabItemModel(AssetsSVG.ic_search, TabType.search),
    FancyTabItemModel(AssetsSVG.ic_create, TabType.create),
    FancyTabItemModel(AssetsSVG.ic_comment, TabType.comment),
    FancyTabItemModel(AssetsSVG.ic_account, TabType.account),
  ];

  Future<bool> onWillPop() async {
    final DateTime currentTime = DateTime.now();

    final bool backButton = _backButtonOnPressed == null ||
        currentTime.difference(_backButtonOnPressed) > Duration(seconds: 3);

    if (backButton) {
      _backButtonOnPressed = currentTime;
      await Fluttertoast.showToast(msg: 'Double click to exit');
      return false;
    }

    return true;
  }

  Color tabColor(TabType type) {
    if (tabType == type) {
      return iconActiveColor;
    }
    return null;
  }

  void onChangeTab(TabType type) {
    tabType = type;
    update();
  }
}
