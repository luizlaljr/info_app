import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'package:info_app/app/modules/home/shared/models/mission_model.dart';

class MissionRepository extends Disposable {
  final Dio client;

  MissionRepository(this.client);

  Future<List<MissionModel>> getMissions() async {
    final response = await client.get('missions');
    
    List<MissionModel> list = [];
    for (var json in (response.data as List)) {
      MissionModel mission = MissionModel.fromJson(json);
      list.add(mission);
    }
    return list;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
