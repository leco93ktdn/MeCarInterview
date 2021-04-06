import 'package:get/get.dart';
import 'package:mecarproject/modules/auth/view/welcome.view.dart';

part 'app_routes.dart';

class AppPage {
  static const String INITIAL = Routes.WELCOM;
  static final List<GetPage> routes = <GetPage>[
    GetPage(name: _Paths.WELCOM, page: () => WelcomeView()),
  ];
}
