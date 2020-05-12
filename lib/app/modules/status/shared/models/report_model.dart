class ReportModel {
  String link;
  num amount;
  double income;

  ReportModel({this.link, this.amount, this.income});

  ReportModel.fromJson(Map<String, dynamic> json) {
    link = json['link'];
    amount = json['amount'];
    income = json['income'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['link'] = this.link;
    data['amount'] = this.amount;
    data['income'] = this.income;
    return data;
  }
}
