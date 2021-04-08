import 'dart:async';
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mecarproject/routes/app_pages.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'constants/themes.dart';
import 'helpers/logger_utils.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runZoned<Future<void>>(() async => runApp(MeCarApp()),
      onError: (dynamic error, dynamic stackTrace) {
    log('Error: $error');
    log('Stack: $stackTrace');
  });
}

class MeCarApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'ThanhSonHoaNongDemo',
      enableLog: true,
      logWriterCallback: Logger.write,
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      initialRoute: AppPage.INITIAL,
      getPages: AppPage.routes,
      builder: (BuildContext context, Widget child) {
        return ResponsiveWrapper.builder(child,
            maxWidth: 1000,
            minWidth: 400,
            defaultScale: true,
            mediaQueryData:
                MediaQuery.of(context).copyWith(textScaleFactor: 1));
      },
    );
  }
}
