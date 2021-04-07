 import 'dart:async';

import 'package:mecarproject/modules/auth/bloc/auth_event.dart';
import 'package:mecarproject/modules/auth/bloc/auth_state.dart';

class RemoteBloc {
  var stateAuth = AuthState();

  final eventAuthController = StreamController<AuthEvent>();

  final stateAuthController = StreamController<AuthState>();

  RemoteBloc() {
    eventAuthController.stream.listen((AuthEvent event) {
      if (event is RegisterEvent) {
        // nếu eventController vừa add vào 1 IncrementEvent thì chúng ta xử lý tăng âm lượng
        stateAuth = AuthState();
      } else if (event is LoginEvent) {
        // xử lý giảm âm lượng
        stateAuth = AuthState();
      } else {
        // xử lý mute
        stateAuth = AuthState();
      }

      // add state mới vào stateController để bên UI nhận được
      stateAuthController.sink.add(stateAuth);
    });
  }

  // khi không cần thiết thì close tất cả controller
  void dispose() {
    stateAuthController.close();
    eventAuthController.close();
  }
}