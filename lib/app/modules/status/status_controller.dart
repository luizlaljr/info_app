import 'package:mobx/mobx.dart';

import 'shared/repositories/user_repository.dart';

part 'status_controller.g.dart';

class StatusController = _StatusControllerBase with _$StatusController;

abstract class _StatusControllerBase with Store {
  final UserRepository userRepository;

  @observable
  ObservableFuture user;

  _StatusControllerBase(this.userRepository) {
    user = userRepository.getUser().asObservable();
  }
}
