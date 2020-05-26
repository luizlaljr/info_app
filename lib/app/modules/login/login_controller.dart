import 'package:flutter_modular/flutter_modular.dart';
import 'package:info_app/app/shared/auth/auth_controller.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  AuthController _auth = Modular.get();

  _LoginControllerBase() {
    try {
      _auth.getUser().then((value) => {
            if (value != '') {Modular.to.pushReplacementNamed('/Tabb')}
          });
    } catch (e) {}
  }

  @observable
  bool loading = false;

  @observable
  String email = '';

  @observable
  String password = '';

  @action
  setEmail(String value) => email = value.trim() + '@fab.mil.br';

  @action
  setPassword(String value) => password = value;

  @action
  Future login() async {
    try {
      loading = true;
      await _auth.login(email, password);
      Modular.to.pushReplacementNamed('/Tabb');
    } catch (e) {
      loading = false;
    }
  }
}
