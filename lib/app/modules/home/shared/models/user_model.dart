class UserModel {
  String trigram;

  UserModel({this.trigram});

  UserModel.fromJson(Map<String, dynamic> json) {
    trigram = json['trigram'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['trigram'] = this.trigram;
    return data;
  }
}
