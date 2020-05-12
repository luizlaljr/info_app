import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:info_app/app/modules/home/home_controller.dart';
import 'package:info_app/app/modules/home/home_page.dart';
import 'package:info_app/app/modules/home/shared/repositories/mission_repository.dart';
import 'package:info_app/app/modules/status/status_module.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => MissionRepository(i.get<Dio>())),
        Bind((i) => HomeController(i.get<MissionRepository>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => HomePage()),
        Router("/Status", module: StatusModule()),
        
      ];

  static Inject get to => Inject<HomeModule>.of();
}
