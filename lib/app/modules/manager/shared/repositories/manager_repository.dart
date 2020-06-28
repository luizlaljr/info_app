import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:info_app/app/modules/manager/shared/models/manager_model.dart';
import 'package:info_app/app/shared/auth/auth_controller.dart';
import 'package:info_app/app/shared/utils/custom_dio/custom_dio.dart';

class ManagerRepository extends Disposable {
  final CustomDio _client = Modular.get();
  final AuthController _auth = Modular.get();

  ManagerRepository();

  Future<List<ManagerModel>> getManager() async {
    final user = await _auth.getUser();
    final response = await _client.dio.get('users/$user/manager',
        options: Options(headers: {'requirestoken': true}));

    List<ManagerModel> list = [];
    for (var json in response.data) {
      ManagerModel manager = ManagerModel.fromJson(json);
      list.add(manager);
    }
    return list;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
