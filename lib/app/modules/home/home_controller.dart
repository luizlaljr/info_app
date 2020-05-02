import 'package:info_app/app/modules/home/shared/repositories/mission_repository.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final MissionRepository repository;

  @observable
  ObservableFuture missions;

  _HomeControllerBase(this.repository){
    missions = repository.getMissions().asObservable();
  }
  
}
