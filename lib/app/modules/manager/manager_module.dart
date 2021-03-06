import 'package:flutter/material.dart';
import 'package:info_app/app/modules/manager/manager_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:info_app/app/modules/manager/manager_page.dart';
import 'package:info_app/app/modules/manager/shared/repositories/manager_repository.dart';
import 'package:info_app/app/modules/manager/submodules/missions/missions_module.dart';

class ManagerModule extends WidgetModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ManagerRepository()),
        Bind((i) => ManagerController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => ManagerPage()),
        Router('/Missions', module: MissionsModule()),
      ];

  @override
  Widget get view => ManagerPage();
}
