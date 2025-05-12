class RoomSearchRequest {
  int? pageNo;
  int? pageSize;
  String? searchVal;

   RoomSearchRequest.initial(){
      pageNo = 1;
      pageSize = 5;
      searchVal = ''; 

   }

  RoomSearchRequest({this.pageNo  , this.pageSize , this.searchVal});

  RoomSearchRequest.fromJson(Map<String, dynamic> json) {
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
