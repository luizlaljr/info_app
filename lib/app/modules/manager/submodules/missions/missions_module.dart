import 'package:flutter/material.dart';

import 'package:info_app/app/modules/manager/submodules/missions/missions_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:info_app/app/modules/manager/submodules/missions/missions_page.dart';
import 'package:info_app/app/modules/manager/submodules/missions/shared/repositories/mission_repository.dart';

class MissionsModule extends WidgetModule {
  @override
  List<Bind> get binds => [
        Bind((i) => MissionRepository()),
        Bind((i) => MissionsController()),
      ];

  @override
  List<Router> get routers => [
        Router('/:title', child: (_, args) => MissionsPage(title: args.params['title'])),
      ];

  @override
  Widget get view => throw MissionsPage(title: Modular.args.params['title'],);
}
