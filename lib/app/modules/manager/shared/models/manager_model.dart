class ManagerModel {
  int id;
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
  num amount;

  ManagerModel({
    this.id,
    this.post,
    this.name,
    this.condition,
    this.dateCondition,
    this.modulus,
    this.prevision,
    this.document,
    this.operationality,
    this.activity,
    this.project,
    this.amount,
  });

  ManagerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
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
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
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
    data['amount'] = this.amount;
    return data;
  }
}
