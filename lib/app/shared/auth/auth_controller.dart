import 'package:flutter_modular/flutter_modular.dart';
import 'package:info_app/app/shared/auth/repositories/auth_repository.dart';
import 'package:mobx/mobx.dart';

part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  final AuthRepository _authRepository = Modular.get();

  @observable
  String user;

  @action
  Future<String> login(String email, String password) async {
    return user = await _authRepository.login(email,password).asObservable();
  }

  Future logout() {
    return _authRepository.logout();
  }
}
