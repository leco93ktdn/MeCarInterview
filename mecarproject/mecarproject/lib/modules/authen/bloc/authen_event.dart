class AuthenEvent {}

class LoadingEvent extends AuthenEvent {
}
class CheckCurrentUserEvent extends AuthenEvent {}

class RegisterEvent extends AuthenEvent {
  String user;
  String pass;

  RegisterEvent(this.user, this.pass);
}

class LoginEvent extends AuthenEvent {
  String user;
  String pass;

  LoginEvent(this.user, this.pass);
}

class LogoutEvent extends AuthenEvent {}
