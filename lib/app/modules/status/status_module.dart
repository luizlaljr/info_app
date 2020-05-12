import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:info_app/app/modules/status/shared/repositories/report_repository.dart';
import 'package:info_app/app/modules/status/status_controller.dart';
import 'package:info_app/app/modules/status/status_page.dart';

class StatusModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ReportRepository(i.get<Dio>())),
        Bind((i) => StatusController(i.get<ReportRepository>())),
      ];

  @override
  List<Router> get routers => [
        Router("/StatusPage",
            child: (_, args) => StatusPage(),
            transition: TransitionType.rightToLeftWithFade),
      ];

  static Inject get to => Inject<StatusModule>.of();
}
