import 'package:info_app/app/modules/tabb/tabb_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:info_app/app/modules/tabb/tabb_page.dart';
import 'package:info_app/app/shared/auth/auth_controller.dart';

class TabbModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => TabbController(i.get<AuthController>())),
        Bind((i) => AuthController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => TabbPage()),
      ];

  static Inject get to => Inject<TabbModule>.of();
                  
}
