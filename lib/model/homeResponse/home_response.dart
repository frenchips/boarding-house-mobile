class HomeOrderResponse {
  String? responseStatus;
  String? status;
  String? message;
  int? pageNo;
  int? pageSize;
  int? totalDataInPage;
  int? totalData;
  int? totalPages;
  List<ListData>? listData;

  HomeOrderResponse(
      {this.responseStatus,
      this.status,
      this.message,
      this.pageNo,
      this.pageSize,
      this.totalDataInPage,
      this.totalData,
      this.totalPages,
      this.listData});

  HomeOrderResponse.fromJson(Map<String, dynamic> json) {
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
  String? roomDate;
  String? orderStatus;
  int? price;
  String? roomStatus;

  ListData(
      {this.roomNo,
      this.roomDate,
      this.orderStatus,
      this.price,
      this.roomStatus});

  ListData.fromJson(Map<String, dynamic> json) {
    roomNo = json['roomNo'];
    roomDate = json['roomDate'];
    orderStatus = json['orderStatus'];
    price = json['price'];
    roomStatus = json['roomStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['roomNo'] = this.roomNo;
    data['roomDate'] = this.roomDate;
    data['orderStatus'] = this.orderStatus;
    data['price'] = this.price;
    data['roomStatus'] = this.roomStatus;
    return data;
  }
}
