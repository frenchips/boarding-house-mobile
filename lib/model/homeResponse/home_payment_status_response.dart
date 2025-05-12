class PaymentStatusResponse {
  String? status;
  String? message;
  String? prosesFinishDate;
  List<Data>? data;

  PaymentStatusResponse(
      {this.status, this.message, this.prosesFinishDate, this.data});

  PaymentStatusResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    prosesFinishDate = json['prosesFinishDate'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['prosesFinishDate'] = this.prosesFinishDate;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? paramCode;
  String? paramType;
  String? paramName;
  String? description;

  Data({this.paramCode, this.paramType, this.paramName, this.description});

  Data.fromJson(Map<String, dynamic> json) {
    paramCode = json['paramCode'];
    paramType = json['paramType'];
    paramName = json['paramName'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['paramCode'] = this.paramCode;
    data['paramType'] = this.paramType;
    data['paramName'] = this.paramName;
    data['description'] = this.description;
    return data;
  }
}
