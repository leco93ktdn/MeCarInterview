import 'package:get/get.dart';
import 'package:mecarproject/modules/auth/view/login/login.view.dart';
import 'package:mecarproject/modules/auth/view/register/register.view.dart';
import 'package:mecarproject/modules/auth/view/welcome.view.dart';

part 'app_routes.dart';

class AppPage {
  static const String INITIAL = Routes.WELCOM;
  static final List<GetPage> routes = <GetPage>[
    GetPage(name: _Paths.WELCOM, page: () => WelcomeView()),
    GetPage(name: _Paths.LOGIN, page: () => LoginView()),
    GetPage(name: _Paths.REGISTER, page: () => RegisterView()),
  ];
}
