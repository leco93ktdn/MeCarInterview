import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mecarproject/routes/app_pages.dart';
import 'authen_event.dart';
import 'authen_state.dart';
import 'package:get/get.dart';

import 'package:google_sign_in/google_sign_in.dart';
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
    final user = await _auth.currentUser;
    if (user != null) {
      print('User is signed in!');
      await Fluttertoast.showToast(msg: user.email);
    } else {
      await Fluttertoast.showToast(msg: 'User is currently signed out!');
    }
    return Future.value(user);
  }

  Future<bool> _callRegister(RegisterEvent event) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(email: event.user, password: event.pass);
      await Fluttertoast.showToast(msg: userCredential.user.email + ' has registered successfully');
      Get.offAllNamed(Routes.DASHBOARD);
      return Future.value(true);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        await Fluttertoast.showToast(msg: 'The password provided is too weak');
      } else if (e.code == 'email-already-in-use') {
        await Fluttertoast.showToast(msg: 'The account already exists for that email');
      } else if (e.code == 'unknown') {
        await Fluttertoast.showToast(msg: 'Given String is empty or null');
      } else {
        await Fluttertoast.showToast(msg: 'Something went wrong');
      }
    } catch (e) {
      await Fluttertoast.showToast(msg: 'Something is wrong');
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
      if (e.code == 'user-not-found') {
        await Fluttertoast.showToast(msg: 'No user found for that email');
      } else if (e.code == 'wrong-password') {
        await Fluttertoast.showToast(msg: 'Wrong password provided for that user');
      } else if (e.code == 'unknown') {
        await Fluttertoast.showToast(msg: 'Given String is empty or null');
      } else {
        await Fluttertoast.showToast(msg: 'Something went wrong');
      }
      return Future.value(null);
    }
  }

  Future<void> _callLogout() async {
    try {
      await _auth.signOut();
      Get.offAllNamed(Routes.LOGIN);
      return;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        await Fluttertoast.showToast(msg: 'No user found for that email');
      } else if (e.code == 'wrong-password') {
        await Fluttertoast.showToast(msg: 'Wrong password provided for that user');
      }
      return;
    }
  }
}
