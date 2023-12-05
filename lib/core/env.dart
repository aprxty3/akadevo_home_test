import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_store_application.dart';
import 'common/app_component.dart';
import 'common/dependency_injection.dart';

enum EnvType { development, staging, production, testing }

class Env {
  static late Env value;

  String get appName => '';

  String get baseUrl => '';

  EnvType environmentType = EnvType.development;

  // Database Config
  int get dbVersion => 1;

  String get dbName => '';

  Env() {
    value = this;
    _init();
  }

  void _init() async {
    runZonedGuarded<Future<void>>(() async {
      WidgetsFlutterBinding.ensureInitialized();
      await SystemChrome.setPreferredOrientations(
        [
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ],
      );
      await DenpendencyInjection.init();

      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
      );

      var application = AppStoreApplication();
      await application.onCreate();

      initializeDateFormatting('id_ID', null)
          .then((_) => runApp(AppComponent(application)));
    }, (error, stack) => Get.log('error: $error, stack: $stack'));
    // FirebaseCrashlytics.instance.recordError(error, stack));
  }
}
