import 'package:flutter_modular/flutter_modular.dart';
import 'package:info_app/app/shared/auth/models/auth_model.dart';
import 'package:info_app/app/shared/auth/repositories/token_repository.dart';
import 'package:info_app/app/shared/utils/custom_dio/custom_dio.dart';

class AuthRepository extends Disposable {
  final TokenRepository _tokenRepository;
  final CustomDio _client;

  AuthRepository(this._tokenRepository, this._client);

  Future<String> login(String email, String password) async {
    final response = await _client.dio.post('/login',data: {'email':email, 'password': password});
    final token = response.data['token'];
    final id = response.data['id'].toString();
    AuthModel auth = AuthModel(token: token, id: id);
    await _tokenRepository.setAuth(auth);
    return id;
  }

  getToken() async {
    final auth = await _tokenRepository.getAuth();
    return auth.token;
  }

  getUser() async {
    final auth = await _tokenRepository.getAuth();
    return auth.id;
  }

  Future logout() async {
    return await _tokenRepository.signOut();
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
