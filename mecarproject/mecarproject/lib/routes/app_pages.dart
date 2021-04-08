import 'package:get/get.dart';
import 'package:mecarproject/modules/authen/view/login/login.view.dart';
import 'package:mecarproject/modules/authen/view/register/register.view.dart';
import 'package:mecarproject/modules/authen/view/welcome.view.dart';
import 'package:mecarproject/modules/dashboard/views/dashboard.view.dart';

part 'app_routes.dart';

class AppPage {
  static const String INITIAL = Routes.WELCOM;
  static final List<GetPage> routes = <GetPage>[
    GetPage(name: _Paths.WELCOM, page: () => WelcomeView()),
    GetPage(name: _Paths.LOGIN, page: () => LoginView()),
    GetPage(name: _Paths.REGISTER, page: () => RegisterView()),
    GetPage(name: _Paths.DASHBOARD, page: () => DashboardView()),
  ];
}
