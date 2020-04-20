import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import '../utils/constants.dart';

class MissionRepository extends Disposable {
  Future getMissions(Dio client) async {
    final response = await client.get(BASE_URL);
    return response.data;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
