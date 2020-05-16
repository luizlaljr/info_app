import 'package:info_app/app/modules/status/shared/models/report_model.dart';

class UserModel {
  String post;
  String name;
  bool condition;
  String dateCondition;
  List<ReportModel> report;

  UserModel(
      {this.post, this.name, this.condition, this.dateCondition, this.report});

  UserModel.fromJson(Map<String, dynamic> json) {
    post = json['post'];
    name = json['name'];
    condition = json['condition'];
    dateCondition = json['date_condition'];
    if (json['report'] != null) {
      report = new List<ReportModel>();
      json['report'].forEach((v) {
        report.add(new ReportModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['post'] = this.post;
    data['name'] = this.name;
    data['condition'] = this.condition;
    data['date_condition'] = this.dateCondition;
    if (this.report != null) {
      data['report'] = this.report.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
