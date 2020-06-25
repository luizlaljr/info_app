class MissionModel {
  String kind;
  String link;
  String number;
  String step;
  String locale;
  num amount;
  int transport;
  num income;
  String start;
  String end;
  num wage;

  MissionModel({
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
    this.wage,
  });

  MissionModel.fromJson(Map<String, dynamic> json) {
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
    wage = json['wage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    data['wage'] = this.wage;
    return data;
  }
}
