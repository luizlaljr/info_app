import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:info_app/app/modules/home/home_controller.dart';
import 'package:info_app/app/modules/home/home_page.dart';
import 'package:info_app/app/modules/home/shared/repositories/mission_repository.dart';

class HomeModule extends WidgetModule {

  @override
  List<Bind> get binds => [
        Bind((i) => MissionRepository()),
        Bind((i) => HomeController()),
      ];

  static Inject get to => Inject<HomeModule>.of();

  @override
  Widget get view => HomePage();
}
