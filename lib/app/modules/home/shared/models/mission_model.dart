import './user_model.dart';

class MissionModel {
  int id;
  String kind;
  String link;
  String number;
  String step;
  String locale;
  double amount;
  int transport;
  double income;
  String start;
  String end;
  String createdAt;
  String updatedAt;
  List<UserModel> users;

  MissionModel(
      {this.id,
      this.kind,
      this.link,
      this.number,
      this.step,
      this.locale,
      this.amount,
      this.transport,
      this.income,
      this.start,
      this.end,
      this.createdAt,
      this.updatedAt,
      this.users});

  MissionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    kind = json['kind'];
    link = json['link'];
    number = json['number'];
    step = json['step'];
    locale = json['locale'];
    amount = json['amount'];
    transport = json['transport'];
    income = json['income'];
    start = json['start'];
    end = json['end'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['users'] != null) {
      users = new List<UserModel>();
      json['users'].forEach((v) {
        users.add(new UserModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['kind'] = this.kind;
    data['link'] = this.link;
    data['number'] = this.number;
    data['step'] = this.step;
    data['locale'] = this.locale;
    data['amount'] = this.amount;
    data['transport'] = this.transport;
    data['income'] = this.income;
    data['start'] = this.start;
    data['end'] = this.end;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.users != null) {
      data['users'] = this.users.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
