class RoomModelRequest {
  String? roomNo;
  String? price;

  RoomModelRequest({this.roomNo, this.price});

  RoomModelRequest.fromJson(Map<String, dynamic> json) {
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
