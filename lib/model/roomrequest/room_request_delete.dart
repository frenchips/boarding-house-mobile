class RoomDeleteRequest {
  List<ListDelete>? listDelete;

  RoomDeleteRequest({this.listDelete});

  RoomDeleteRequest.fromJson(Map<String, dynamic> json) {
    if (json['listDelete'] != null) {
      listDelete = <ListDelete>[];
      json['listDelete'].forEach((v) {
        listDelete!.add(new ListDelete.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.listDelete != null) {
      data['listDelete'] = this.listDelete!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListDelete {
  String? no;
  bool? isCek;

  ListDelete({this.no});

  ListDelete.fromJson(Map<String, dynamic> json) {
    no = json['no'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['no'] = this.no;
    return data;
  }
}
