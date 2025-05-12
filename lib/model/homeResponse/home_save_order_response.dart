class HomeSaveOrderResponse {
  String? status;
  String? message;
  String? prosesFinishDate;
  Data? data;

  HomeSaveOrderResponse(
      {this.status, this.message, this.prosesFinishDate, this.data});

  HomeSaveOrderResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    prosesFinishDate = json['prosesFinishDate'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['prosesFinishDate'] = this.prosesFinishDate;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? createBy;
  String? createAt;
  Null? updateBy;
  Null? updateAt;
  String? recordFlag;
  String? internalId;
  String? orderName;
  String? orderDate;
  String? maritalStatus;
  int? totalOrder;
  String? orderStatus;
  List<PersonList>? personList;

  Data(
      {this.createBy,
      this.createAt,
      this.updateBy,
      this.updateAt,
      this.recordFlag,
      this.internalId,
      this.orderName,
      this.orderDate,
      this.maritalStatus,
      this.totalOrder,
      this.orderStatus,
      this.personList});

  Data.fromJson(Map<String, dynamic> json) {
    createBy = json['createBy'];
    createAt = json['createAt'];
    updateBy = json['updateBy'];
    updateAt = json['updateAt'];
    recordFlag = json['recordFlag'];
    internalId = json['internalId'];
    orderName = json['orderName'];
    orderDate = json['orderDate'];
    maritalStatus = json['maritalStatus'];
    totalOrder = json['totalOrder'];
    orderStatus = json['orderStatus'];
    if (json['personList'] != null) {
      personList = <PersonList>[];
      json['personList'].forEach((v) {
        personList!.add(new PersonList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createBy'] = this.createBy;
    data['createAt'] = this.createAt;
    data['updateBy'] = this.updateBy;
    data['updateAt'] = this.updateAt;
    data['recordFlag'] = this.recordFlag;
    data['internalId'] = this.internalId;
    data['orderName'] = this.orderName;
    data['orderDate'] = this.orderDate;
    data['maritalStatus'] = this.maritalStatus;
    data['totalOrder'] = this.totalOrder;
    data['orderStatus'] = this.orderStatus;
    if (this.personList != null) {
      data['personList'] = this.personList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PersonList {
  String? createBy;
  String? createAt;
  Null? updateBy;
  Null? updateAt;
  String? recordFlag;
  String? personId;
  String? fullName;
  String? gender;
  int? nik;

  PersonList(
      {this.createBy,
      this.createAt,
      this.updateBy,
      this.updateAt,
      this.recordFlag,
      this.personId,
      this.fullName,
      this.gender,
      this.nik});

  PersonList.fromJson(Map<String, dynamic> json) {
    createBy = json['createBy'];
    createAt = json['createAt'];
    updateBy = json['updateBy'];
    updateAt = json['updateAt'];
    recordFlag = json['recordFlag'];
    personId = json['personId'];
    fullName = json['fullName'];
    gender = json['gender'];
    nik = json['nik'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createBy'] = this.createBy;
    data['createAt'] = this.createAt;
    data['updateBy'] = this.updateBy;
    data['updateAt'] = this.updateAt;
    data['recordFlag'] = this.recordFlag;
    data['personId'] = this.personId;
    data['fullName'] = this.fullName;
    data['gender'] = this.gender;
    data['nik'] = this.nik;
    return data;
  }
}
