class HomeOrderRequest {
  int? pageNo;
  int? pageSize;
  String? searchVal;

  HomeOrderRequest({this.pageNo = 1, this.pageSize = 5, this.searchVal});

  HomeOrderRequest.fromJson(Map<String, dynamic> json) {
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
