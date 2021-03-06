import 'package:flutter_modular/flutter_modular.dart';
import 'package:info_app/app/shared/auth/models/auth_model.dart';
import 'package:info_app/app/shared/auth/repositories/token_repository.dart';
import 'package:info_app/app/shared/utils/custom_dio/custom_dio.dart';

class AuthRepository extends Disposable {
  final TokenRepository _tokenRepository = Modular.get();
  final CustomDio _client = Modular.get();

  Future<String> login(String email, String password) async {
    final response = await _client.dio
        .post('/login', data: {'email': email, 'password': password});
    final token = response.data['token'];
    final id = response.data['id'].toString();
    final profile = response.data['profile'];
    AuthModel auth = AuthModel(token: token, id: id, profile: profile);
    await _tokenRepository.setAuth(auth);

    return id;
  }

  Future<String> getToken() async {
    final auth = await _tokenRepository.getAuth();
    return auth.token;
  }

  Future<String> getUser() async {
    final auth = await _tokenRepository.getAuth();
    return auth.id;
  }

  Future<String> getProfile() async {
    final auth = await _tokenRepository.getAuth();
    return auth.profile;
  }

  Future logout() async {
    return await _tokenRepository.signOut();
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
