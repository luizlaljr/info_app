import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:info_app/app/shared/utils/custom_dio/custom_interceptors.dart';

import '../constants.dart';

class CustomDio {
  final Dio dio;
  final CustomInterceptors customInterceptors = Modular.get();

  CustomDio(this.dio) {
    dio.options.baseUrl = BASE_URL;
    dio.options.connectTimeout = 5000;
    dio.interceptors.add(customInterceptors);
  }
}
