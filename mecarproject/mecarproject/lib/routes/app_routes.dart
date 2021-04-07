part of 'app_pages.dart';

abstract class Routes {
  static const String WELCOM = _Paths.WELCOM;
  static const String LOGIN = _Paths.LOGIN;
  static const String REGISTER = _Paths.REGISTER;
  static const String DASHBOARD = _Paths.DASHBOARD;
}

abstract class _Paths {
  static const String WELCOM = '/welcome';
  static const String LOGIN = '/login';
  static const String REGISTER = '/register';
  static const String DASHBOARD = '/dashboard';
}
