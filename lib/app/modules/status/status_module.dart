import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:info_app/app/modules/status/shared/repositories/user_repository.dart';
import 'package:info_app/app/modules/status/status_controller.dart';
import 'package:info_app/app/modules/status/status_page.dart';

class StatusModule extends WidgetModule {
  @override
  List<Bind> get binds => [
        Bind((i) => UserRepository()),
        Bind((i) => StatusController()),
      ];

  static Inject get to => Inject<StatusModule>.of();

  @override
  Widget get view => StatusPage();
}
