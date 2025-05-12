class HomeSaveOrderRequest {
  String? orderName;
  String? roomNo;
  String? orderStatus;
  int? totalOrder;
  List<ListPerson>? listPerson;

  HomeSaveOrderRequest(
      {this.orderName,
      this.roomNo,
      this.orderStatus,
      this.totalOrder,
      this.listPerson});

  HomeSaveOrderRequest.fromJson(Map<String, dynamic> json) {
    orderName = json['orderName'];
    roomNo = json['roomNo'];
    orderStatus = json['orderStatus'];
    totalOrder = json['totalOrder'];
    if (json['listPerson'] != null) {
      listPerson = <ListPerson>[];
      json['listPerson'].forEach((v) {
        listPerson!.add(new ListPerson.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderName'] = this.orderName;
    data['roomNo'] = this.roomNo;
    data['orderStatus'] = this.orderStatus;
    data['totalOrder'] = this.totalOrder;
    if (this.listPerson != null) {
      data['listPerson'] = this.listPerson!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListPerson {
  String? fullName;
  String? gender;
  int? nik;

  ListPerson({this.fullName, this.gender, this.nik});

  ListPerson.fromJson(Map<String, dynamic> json) {
    fullName = json['fullName'];
    gender = json['gender'];
    nik = json['nik'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fullName'] = this.fullName;
    data['gender'] = this.gender;
    data['nik'] = this.nik;
    return data;
  }
}
