import 'package:info_app/app/modules/status/shared/models/report_model.dart';

class UserModel {
  String post;
  String name;
  bool condition;
  String dateCondition;
  String document;
  String operationality;
  String activity;
  String project;
  String sex;
  List<ReportModel> reports;

  UserModel(
      {this.post, this.name, this.condition, this.dateCondition, this.reports});

  UserModel.fromJson(Map<String, dynamic> json) {
    post = json['post'];
    name = json['name'];
    condition = json['condition'];
    dateCondition = json['date_condition'];
    document = json['document'];
    operationality = json['operationality'];
    activity = json['activity'];
    project = json['project'];
    sex = json['sex'];
    if (json['reports'] != null) {
      reports = new List<ReportModel>();
      json['reports'].forEach((v) {
        reports.add(new ReportModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['post'] = this.post;
    data['name'] = this.name;
    data['condition'] = this.condition;
    data['date_condition'] = this.dateCondition;
    data['document'] = this.document;
    data['operationality'] = this.operationality;
    data['activity'] = this.activity;
    data['project'] = this.project;
    data['sex'] = this.sex;
    if (this.reports != null) {
      data['reports'] = this.reports.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
