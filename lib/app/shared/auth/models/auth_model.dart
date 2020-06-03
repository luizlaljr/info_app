class AuthModel {
  String token;
  String id;
  String profile;

  AuthModel({this.token, this.id, this.profile});

  AuthModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    id = json['id'];
    profile = json['profile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['id'] = this.id;
    data['profile'] = this.profile;
    return data;
  }
}
