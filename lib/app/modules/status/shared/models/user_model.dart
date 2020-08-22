import 'package:info_app/app/modules/status/shared/models/report_model.dart';

class UserModel {
  String post;
  String name;
  bool condition;
  String dateCondition;
  bool modulus;
  num prevision;
  String document;
  String operationality;
  String activity;
  String project;
  String sex;
  String skin;
  num wage;
  List<ReportModel> reports;

  UserModel(
      {this.post,
      this.name,
      this.condition,
      this.dateCondition,
      this.modulus,
      this.prevision,
      this.document,
      this.operationality,
      this.activity,
      this.project,
      this.sex,
      this.skin,
      this.wage,
      this.reports});

  UserModel.fromJson(Map<String, dynamic> json) {
    post = json['post'];
    name = json['name'];
    condition = json['condition'];
    dateCondition = json['date_condition'];
    modulus = json['modulus'];
    prevision = json['prevision'];
    document = json['document'];
    operationality = json['operationality'];
    activity = json['activity'];
    project = json['project'];
    sex = json['sex'];
    skin = json['skin'];
    wage = json['wage'];
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
    data['modulus'] = this.modulus;
    data['prevision'] = this.prevision;
    data['document'] = this.document;
    data['operationality'] = this.operationality;
    data['activity'] = this.activity;
    data['project'] = this.project;
    data['sex'] = this.sex;
    data['skin'] = this.skin;
    data['wage'] = this.wage;
    if (this.reports != null) {
      data['reports'] = this.reports.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
