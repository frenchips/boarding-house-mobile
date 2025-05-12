class CreateUserModel {
  String? name;
  String? job;

  CreateUserModel({this.name, this.job});

  CreateUserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    job = json['job'];
  }

  Map<String, dynamic>toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['job'] = this.job;
    return data;
  }
}
