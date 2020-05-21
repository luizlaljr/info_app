import 'package:flutter_modular/flutter_modular.dart';
import 'package:info_app/app/modules/status/shared/repositories/user_repository.dart';
import 'package:info_app/app/modules/status/status_controller.dart';
import 'package:info_app/app/modules/status/status_page.dart';

class StatusModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => UserRepository()),
        Bind((i) => StatusController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute,
            child: (_, args) => StatusPage(),
            transition: TransitionType.rightToLeftWithFade),
      ];

  static Inject get to => Inject<StatusModule>.of();
}
