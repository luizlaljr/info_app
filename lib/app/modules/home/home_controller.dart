import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:info_app/app/modules/home/shared/repositories/mission_repository.dart';
import 'package:info_app/app/shared/auth/auth_controller.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final MissionRepository _repository = Modular.get();

  @observable
  ObservableFuture missions;

  _HomeControllerBase() {    
    missions = _repository.getMissions().asObservable();
  }

  Future logoff() async {
    await Modular.get<AuthController>().logout();
    Modular.to.pushNamedAndRemoveUntil(Modular.initialRoute, ModalRoute.withName(Modular.initialRoute));
  }
}
