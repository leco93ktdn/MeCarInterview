import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mecarproject/constants/assets.dart';
import 'package:mecarproject/constants/colors.dart';
import '../../../constants/themes.dart';
import '../controllers/tabbar_controller.dart';
import '../models/fancy_tab_item.model.dart';
import '../views/dashboard.view.dart';

class BottomBarItem extends StatelessWidget {
  const BottomBarItem({Key key, this.tabItem, this.iconColor})
      : super(key: key);

  final FancyTabItemModel tabItem;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: () => Get.find<TabbarController>().onChangeTab(tabItem.type),
          child: (tabItem.type == TabType.create)
              ? Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: gradientButton),
                  child: SvgPicture.asset(AssetsSVG.ic_create,
                      height: 13, width: 13),
                )
              : Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: SvgPicture.asset(
                    tabItem.icon,
                    width: 40,
                    height: 40,
                    color: iconColor,
                  ),
                ),
        ),
      ),
    );
  }
}
