import 'package:flutter_modular/flutter_modular.dart';
import 'package:info_app/app/modules/home/home_controller.dart';
import 'package:info_app/app/modules/home/home_page.dart';
import 'package:info_app/app/modules/home/shared/repositories/mission_repository.dart';
import 'package:info_app/app/shared/utils/custom_dio/custom_dio.dart';

class HomeModule extends ChildModule {

  @override
  List<Bind> get binds => [
        Bind((i) => MissionRepository(i.get<CustomDio>())),
        Bind((i) => HomeController(i.get<MissionRepository>())),
      ];

  @override
  List<Router> get routers => [
        Router("/Home", child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
