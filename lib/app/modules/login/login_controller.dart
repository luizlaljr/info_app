import 'package:flutter_modular/flutter_modular.dart';
import 'package:info_app/app/shared/auth/auth_controller.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  AuthController auth = Modular.get();

  @observable
  bool loading = false;

  @observable
  String email = '';

  @observable
  String password = '';

  @action
  setEmail(String value) => email = value + '@fab.mil.br';

  @action
  setPassword(String value) => password = value;

  @action
  Future login() async {
    try {
      loading = true;
      await auth.login(email, password);
      Modular.to.pushReplacementNamed('/Home');
    } catch (e) {
      loading = false;
    }
  }
}
