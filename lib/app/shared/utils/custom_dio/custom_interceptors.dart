import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:info_app/app/shared/auth/repositories/token_repository.dart';

class CustomInterceptors extends Interceptor {
  final TokenRepository tokenRepository = Modular.get();

  @override
  Future<dynamic> onRequest(RequestOptions options) async {
    if (options.headers.containsKey("requirestoken")) {
      //remove the auxiliary header
      options.headers.remove("requiresToken");

      var auth = await tokenRepository.getAuth();
      var token = auth.token;

      options.headers.addAll({"Authorization": "$token"});

      return options;
    }
  }
}
