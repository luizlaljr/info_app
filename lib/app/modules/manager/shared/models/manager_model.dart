class ManagerModel {
  String post;
  String name;
  bool condition;
  String dateCondition;
  String document;
  String operationality;
  String activity;
  String project;
  num amount;

  ManagerModel({
    this.post,
    this.name,
    this.condition,
    this.dateCondition,
    this.document,
    this.operationality,
    this.activity,
    this.project,
    this.amount,
  });

  ManagerModel.fromJson(Map<String, dynamic> json) {
    post = json['post'];
    name = json['name'];
    condition = json['condition'];
    dateCondition = json['date_condition'];
    document = json['document'];
    operationality = json['operationality'];
    activity = json['activity'];
    project = json['project'];
    amount = json['amount'];
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
    data['amount'] = this.amount;
    return data;
  }
}
