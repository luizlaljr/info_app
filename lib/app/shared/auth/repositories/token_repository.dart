import 'package:flutter_modular/flutter_modular.dart';
import 'package:info_app/app/shared/auth/models/auth_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenRepository extends Disposable {
  Future<AuthModel> getAuth() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var authList = prefs.getStringList('auth') ?? [];
    AuthModel auth;
    if (authList.isNotEmpty) {
      auth = AuthModel(token: authList[0], id: authList[1]);
    } else {
      auth = _authEmpty();
    }
    return auth;
  }

  Future setAuth(AuthModel auth) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    auth.token = 'Bearer ' + auth.token;
    prefs.setStringList('auth', [auth.token, auth.id]);
  }

  Future signOut() async {
    AuthModel auth = _authEmpty();
    await setAuth(auth);
  }

  AuthModel _authEmpty() {
    AuthModel auth = AuthModel(token: '', id: '');
    return auth;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
