import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:info_app/app/modules/status/shared/models/report_model.dart';
import 'package:info_app/app/modules/status/shared/models/user_model.dart';
import 'package:info_app/app/shared/auth/repositories/auth_repository.dart';
import 'package:info_app/app/shared/utils/custom_dio/custom_dio.dart';

class UserRepository extends Disposable {
  final CustomDio _client;
  final AuthRepository _authRepository = Modular.get();

  UserRepository(this._client);

  Future<UserModel> getUser() async {
    final user = await _authRepository.getUser();
    final response = await _client.dio.get('users/$user/totalizers',
        options: Options(headers: {'requirestoken': true}));

    UserModel userModel = UserModel.fromJson(response.data);
    List<ReportModel> listReports = [];
    for (var report in userModel.report) {
      ReportModel reportModel = ReportModel(
          link: report.link, income: report.income, amount: report.amount);
      listReports.add(reportModel);
    }
    userModel.report = listReports;
    return userModel;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
