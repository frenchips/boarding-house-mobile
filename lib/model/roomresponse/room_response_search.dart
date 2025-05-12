class RoomSearchResponse {
  String? responseStatus;
  String? status;
  String? message;
  int? pageNo;
  int? pageSize;
  int? totalDataInPage;
  int? totalData;
  int? totalPages;
  List<ListData>? listData;

  RoomSearchResponse(
      {this.responseStatus,
      this.status,
      this.message,
      this.pageNo,
      this.pageSize,
      this.totalDataInPage,
      this.totalData,
      this.totalPages,
      this.listData});

  RoomSearchResponse.fromJson(Map<String, dynamic> json) {
    responseStatus = json['responseStatus'];
    status = json['status'];
    message = json['message'];
    pageNo = json['pageNo'];
    pageSize = json['pageSize'];
    totalDataInPage = json['totalDataInPage'];
    totalData = json['totalData'];
    totalPages = json['totalPages'];
    if (json['listData'] != null) {
      listData = <ListData>[];
      json['listData'].forEach((v) {
        listData!.add(new ListData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['responseStatus'] = this.responseStatus;
    data['status'] = this.status;
    data['message'] = this.message;
    data['pageNo'] = this.pageNo;
    data['pageSize'] = this.pageSize;
    data['totalDataInPage'] = this.totalDataInPage;
    data['totalData'] = this.totalData;
    data['totalPages'] = this.totalPages;
    if (this.listData != null) {
      data['listData'] = this.listData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListData {
  String? roomNo;
  int? price;
  bool? inSelected = false;

  ListData({this.roomNo, this.price});

  ListData.fromJson(Map<String, dynamic> json) {
    roomNo = json['roomNo'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['roomNo'] = this.roomNo;
    data['price'] = this.price;
    return data;
  }
}
