class ParameterSearchResponse {
  String? responseStatus;
  String? status;
  String? message;
  int? pageNo;
  int? pageSize;
  int? totalDataInPage;
  int? totalData;
  int? totalPages;
  List<ListData>? listData;

  ParameterSearchResponse(
      {this.responseStatus,
      this.status,
      this.message,
      this.pageNo,
      this.pageSize,
      this.totalDataInPage,
      this.totalData,
      this.totalPages,
      this.listData});



  ParameterSearchResponse.fromJson(Map<String, dynamic> json) {
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


    Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pageNo': pageNo,
      'pageSize': pageSize,
      'totalDataInPage': totalDataInPage,
      'totalData': totalData,
      'totalPages': totalPages,
      'listData': listData!.map((x) => x.toMap()).toList(),
    };
  }
}

class ListData {
  String? paramTypeCode;
  String? paramTypeName;
  String? detailName;
  List<ListDetail>? listDetail;

  ListData(
      {this.paramTypeCode,
      this.paramTypeName,
      this.detailName,
      this.listDetail});

  ListData.fromJson(Map<String, dynamic> json) {
    paramTypeCode = json['paramTypeCode'];
    paramTypeName = json['paramTypeName'];
    detailName = json['detailName'];
    if (json['listDetail'] != null) {
      listDetail = <ListDetail>[];
      json['listDetail'].forEach((v) {
        listDetail!.add(new ListDetail.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['paramTypeCode'] = this.paramTypeCode;
    data['paramTypeName'] = this.paramTypeName;
    data['detailName'] = this.detailName;
    if (this.listDetail != null) {
      data['listDetail'] = this.listDetail!.map((v) => v.toJson()).toList();
    }
    return data;
  }
  
   Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'paramCode': paramTypeCode,
      'paramName': paramTypeName,
      'detailName': detailName,
      'listDetailResponse': listDetail!.map((x) => x.toMap()).toList(),
    };
  }
}

class ListDetail {
  String? paramCode;
  Null? paramType;
  String? paramName;
  String? description;

  ListDetail(
      {this.paramCode, this.paramType, this.paramName, this.description});

  ListDetail.fromJson(Map<String, dynamic> json) {
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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'detailCode': paramCode,
      'detailName': paramName,
      'description': description
    };
  }
}
