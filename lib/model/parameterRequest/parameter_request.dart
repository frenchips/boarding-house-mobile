class ParameterSearchRequest {
  int? pageNo;
  int? pageSize;
  String? searchVal;

  ParameterSearchRequest.intial({
    this.searchVal = "",
    this.pageNo = 1,
    this.pageSize = 5,
  });

  ParameterSearchRequest({this.pageNo, this.pageSize, this.searchVal});

  ParameterSearchRequest.fromJson(Map<String, dynamic> json) {
    pageNo = json['pageNo'];
    pageSize = json['pageSize'];
    searchVal = json['searchVal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pageNo'] = this.pageNo;
    data['pageSize'] = this.pageSize;
    data['searchVal'] = this.searchVal;
    return data;
  }
}
