import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:info_app/app/modules/manager/shared/repositories/manager_repository.dart';
import 'package:info_app/app/shared/auth/auth_controller.dart';
import 'package:mobx/mobx.dart';

part 'manager_controller.g.dart';

class ManagerController = _ManagerControllerBase with _$ManagerController;

abstract class _ManagerControllerBase with Store {
  final ManagerRepository _repository = Modular.get();

  @observable
  ObservableFuture manager;

  _ManagerControllerBase() {
    manager = _repository.getManager().asObservable();
  }

  Future logoff() async {
    await Modular.get<AuthController>().logout();
    Modular.to.pushNamedAndRemoveUntil(
        Modular.initialRoute, ModalRoute.withName(Modular.initialRoute));
  }
}
