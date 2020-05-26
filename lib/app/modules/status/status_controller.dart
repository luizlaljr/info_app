import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'shared/repositories/user_repository.dart';
import 'package:info_app/app/shared/auth/auth_controller.dart';
import 'package:mobx/mobx.dart';

part 'status_controller.g.dart';

class StatusController = _StatusControllerBase with _$StatusController;

abstract class _StatusControllerBase with Store {
  final UserRepository userRepository = Modular.get();

  @observable
  ObservableFuture user;

  _StatusControllerBase() {
    user = userRepository.getUser().asObservable();
  }

  Future logoff() async {
    await Modular.get<AuthController>().logout();
    Modular.to.pushNamedAndRemoveUntil(
        Modular.initialRoute, ModalRoute.withName(Modular.initialRoute));
  }
}
