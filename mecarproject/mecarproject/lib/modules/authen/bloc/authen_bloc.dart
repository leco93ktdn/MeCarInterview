import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mecarproject/helpers/logger_utils.dart';
import 'package:mecarproject/routes/app_pages.dart';
import 'authen_event.dart';
import 'authen_state.dart';
import 'package:get/get.dart';


class AuthenBloc extends Bloc<AuthenEvent, AuthenState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var stateAuthen = AuthenState();

  AuthenBloc(AuthenState initialState) : super(initialState);

  @override
  Stream<AuthenState> mapEventToState(AuthenEvent event) async* {
    if (event is LoadingEvent) {
      yield AuthenLoadingState();
      return;
    }
    if (event is CheckCurrentUserEvent) {
      final result = await _checkLogin();
      yield CheckCurrentUserState(result);
      return;
    } else if (event is RegisterEvent) {
      final result = await _callRegister(event);
      yield RegisterState(result);
      return;
    } else if (event is LoginEvent) {
      final result = await _callLogin(event);
      yield LoginState(result);
      return;
    } else if (event is LogoutEvent) {
      await _callLogout();
      yield LogoutState();
      return;
    }
  }

  Future<User> _checkLogin() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        await Fluttertoast.showToast(msg: 'The current account is ' + user.displayName);
      } else {
        await Fluttertoast.showToast(msg: 'Sign in to use the app!');
      }
      return Future.value(user);
    } on FirebaseAuthException catch (e) {
      Logger.write(e.code);
      await Fluttertoast.showToast(msg: e.message);
    } catch (e) {
      Logger.write(e);
      await Fluttertoast.showToast(msg: "Something went wrong");
    }
    return Future.value(null);
  }

  Future<bool> _callRegister(RegisterEvent event) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(email: event.user, password: event.pass);
      userCredential.user.updateProfile(displayName: event.user.substring(0, event.user.indexOf('@')));
      await Fluttertoast.showToast(msg: userCredential.user.email + ' has registered successfully');
      Get.offAllNamed(Routes.DASHBOARD);
      return Future.value(true);
    } on FirebaseAuthException catch (e) {
      Logger.write(e.code);
      await Fluttertoast.showToast(msg: e.message);
    } catch (e) {
      Logger.write(e);
      await Fluttertoast.showToast(msg: "Something went wrong");
    }
    return Future.value(false);
  }

  Future<User> _callLogin(LoginEvent event) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(email: event.user, password: event.pass);
      await Fluttertoast.showToast(msg: userCredential.user.email + " has logged in successfully");
      Get.offAllNamed(Routes.DASHBOARD);
      return Future.value(userCredential.user);
    } on FirebaseAuthException catch (e) {
      Logger.write(e.code);
      await Fluttertoast.showToast(msg: e.message);
    } catch (e) {
      Logger.write(e);
      await Fluttertoast.showToast(msg: "Something went wrong");
    }
    return Future.value(null);
  }

  Future<void> _callLogout() async {
    try {
      await _auth.signOut();
      Get.offAllNamed(Routes.LOGIN);
    } on FirebaseAuthException catch (e) {
      Logger.write(e.code);
      await Fluttertoast.showToast(msg: e.message);
    } catch (e) {
      Logger.write(e);
      await Fluttertoast.showToast(msg: "Something went wrong");
    }
    return;
  }
}
