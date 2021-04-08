import 'package:firebase_auth/firebase_auth.dart';

class AuthenState {}

class AuthenLoadingState extends AuthenState {
}

class CheckCurrentUserState extends AuthenState {
  User user;
  CheckCurrentUserState(this.user) : assert(user != null);
}

class RegisterState extends AuthenState {
  bool success = false;
  RegisterState(this.success);
}

class LoginState extends AuthenState {
  User user;
  LoginState(this.user);
}

class LogoutState extends AuthenState {
}
