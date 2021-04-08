import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mecarproject/constants/themes.dart';
import 'package:mecarproject/modules/authen/bloc/authen_bloc.dart';
import 'package:mecarproject/modules/authen/bloc/authen_event.dart';
import 'package:mecarproject/modules/authen/bloc/authen_state.dart';
import 'package:mecarproject/modules/home/views/home_view.dart';
import 'package:mecarproject/widgets/default_button_widget.dart';
import '../../../constants/assets.dart';
import '../../../constants/colors.dart';
import '../controllers/tabbar_controller.dart';
import '../models/fancy_tab_item.model.dart';
import '../widgets/bottom_bar_item.dart';

enum TabType { home, search, create, comment, account }

class DashboardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GetBuilder<TabbarController>(
            init: TabbarController(),
            builder: (_) {
              return WillPopScope(
                onWillPop: _.onWillPop,
                child: SafeArea(
                  top: false,
                  bottom: false,
                  child: Scaffold(
                    extendBody: true,
                    backgroundColor: backgroundOneColor,
                    body: _mapBodyByTab(),
                    bottomNavigationBar: _bottomAppBar(),
                  ),
                ),
              );
            }),
      ],
    );
  }

  Widget _mapBodyByTab() {
    switch (Get.find<TabbarController>().tabType) {
      case TabType.home:
        return HomeView();
      case TabType.search:
        return _emptyView();
      case TabType.create:
        return _emptyView();
      case TabType.comment:
        return _emptyView();
      case TabType.account:
        return Account();
      default:
        return _emptyView();
    }
  }

  Widget _bottomAppBar() {
    return Container(
      decoration: BoxDecoration(border: Border(top: BorderSide(width: 1.0, color: Colors.grey))),
      child: BottomAppBar(
        color: backgroundOneColor,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List<BottomBarItem>.generate(Get.find<TabbarController>().tabs.length, (int index) {
            final FancyTabItemModel _item = Get.find<TabbarController>().tabs[index];
            return BottomBarItem(
              tabItem: _item,
              iconColor: Get.find<TabbarController>().tabColor(_item.type),
            );
          }),
        ),
      ),
    );
  }

  Widget _emptyView() {
   return Center(
      child: Text(
        "Undeveloped functionality",
        style: headerStyle,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget Account() {
    AuthenState state;
    AuthenBloc _getAuthenBloc = AuthenBloc(state);
    return BlocProvider(
      create: (context) => _getAuthenBloc,
      child: Container(
          color: backgroundOneColor,
          child: BlocBuilder<AuthenBloc, AuthenState>(builder: (context, state) {
            return Center(
              child: DefaultButtonWidget(
                title: "Log out",
                width: MediaQuery.of(context).size.width/2,
                onPressed: () {
                  _getAuthenBloc.add(LoadingEvent());
                  _getAuthenBloc.add(LogoutEvent());
                },
              ),
            );
          })),
    );
  }
}
