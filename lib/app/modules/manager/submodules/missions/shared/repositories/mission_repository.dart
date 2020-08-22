import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:info_app/app/modules/manager/submodules/missions/shared/models/mission_model.dart';
import 'package:info_app/app/shared/utils/custom_dio/custom_dio.dart';

class MissionRepository extends Disposable {
  final CustomDio _client = Modular.get();

  MissionRepository();

  Future<List<MissionModel>> getMissions(int user) async {
    final response = await _client.dio.get('users/$user/reports',
        options: Options(headers: {'requirestoken': true}));

    List<MissionModel> list = [];
    for (var json in response.data) {
      MissionModel mission = MissionModel.fromJson(json);
      list.add(mission);
    }
    return list;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
