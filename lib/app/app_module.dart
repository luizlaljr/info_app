import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:info_app/app/app_controller.dart';
import 'package:info_app/app/app_widget.dart';
import 'package:info_app/app/modules/tabb/tabb_module.dart';
import 'package:info_app/app/shared/auth/auth_controller.dart';
import 'package:info_app/app/shared/auth/repositories/auth_repository.dart';
import 'package:info_app/app/shared/auth/repositories/token_repository.dart';
import 'package:info_app/app/shared/utils/custom_dio/custom_interceptors.dart';

import 'modules/login/login_module.dart';
import 'shared/utils/custom_dio/custom_dio.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => TokenRepository()),
        Bind((i) => AuthRepository()),
        Bind((i) => AuthController()),
        Bind((i) => Dio()),
        Bind((i) => CustomDio()),
        Bind((i) => CustomInterceptors()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: LoginModule()),
        Router("/Tabb", module: TabbModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
