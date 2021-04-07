abstract class AuthEvent{

}

class LoginEvent extends AuthEvent{
  LoginEvent();
}
class RegisterEvent extends AuthEvent{
  RegisterEvent();
}