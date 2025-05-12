class RoomModelResponse {
  String? status;
  String? message;
  String? prosesFinishDate;
  Data? data;

  RoomModelResponse(
      {this.status, this.message, this.prosesFinishDate, this.data});

  RoomModelResponse.fromJson(Map<String, dynamic> json) {
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
  int? roomId;
  String? roomNo;
  int? price;
  String? roomStatus;

  Data(
      {this.createBy,
      this.createAt,
      this.updateBy,
      this.updateAt,
      this.recordFlag,
      this.roomId,
      this.roomNo,
      this.price,
      this.roomStatus});

  Data.fromJson(Map<String, dynamic> json) {
    createBy = json['createBy'];
    createAt = json['createAt'];
    updateBy = json['updateBy'];
    updateAt = json['updateAt'];
    recordFlag = json['recordFlag'];
    roomId = json['roomId'];
    roomNo = json['roomNo'];
    price = json['price'];
    roomStatus = json['roomStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createBy'] = this.createBy;
    data['createAt'] = this.createAt;
    data['updateBy'] = this.updateBy;
    data['updateAt'] = this.updateAt;
    data['recordFlag'] = this.recordFlag;
    data['roomId'] = this.roomId;
    data['roomNo'] = this.roomNo;
    data['price'] = this.price;
    data['roomStatus'] = this.roomStatus;
    return data;
  }
}
