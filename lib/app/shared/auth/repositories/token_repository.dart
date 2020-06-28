import 'package:flutter_modular/flutter_modular.dart';
import 'package:info_app/app/shared/auth/models/auth_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenRepository extends Disposable {

  Future<SharedPreferences> _getShared() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs;
  }

  Future<AuthModel> getAuth() async {
    SharedPreferences prefs = await _getShared();
    var authList = prefs.getStringList('auth');
    AuthModel auth = AuthModel(token: '', id: '', profile: '');
    if (authList != null) {
      auth = AuthModel(
        token: authList[0],
        id: authList[1],
        profile: authList[2],
      );
    }
    return auth;
  }

  Future setAuth(AuthModel auth) async {
    SharedPreferences prefs = await _getShared();
    auth.token = 'Bearer ' + auth.token;
    prefs.setStringList('auth', [
      auth.token,
      auth.id,
      auth.profile,
    ]);
  }

  Future signOut() async {
    SharedPreferences prefs = await _getShared();
    await prefs.remove('auth');
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
