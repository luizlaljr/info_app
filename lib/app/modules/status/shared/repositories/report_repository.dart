import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'package:info_app/app/modules/status/shared/models/report_model.dart';

class ReportRepository extends Disposable {
  final Dio client;

  ReportRepository(this.client);

  Future<List<ReportModel>> getReports() async {
    final response = await client.get('users/2/totalizers');

    List<ReportModel> list = [];
    for (var json in response.data) {
      ReportModel report = ReportModel.fromJson(json);
      list.add(report);
    }
    return list;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
