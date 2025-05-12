


import 'package:ada_kost/model/roomrequest/room_model_add.dart';
import 'package:ada_kost/model/roomrequest/room_request_delete.dart';
import 'package:ada_kost/model/roomrequest/room_request_search.dart';

class RoomEvent{}

class CreateRoom extends RoomEvent{
    final RoomModelRequest model;
    CreateRoom(this.model);
}

class FetchRoomData extends RoomEvent{
  RoomSearchRequest req;
  FetchRoomData(this.req);
}

class LoadRoomData extends RoomEvent{
  final RoomSearchRequest req;
  LoadRoomData(this.req);
}

class DeleteRoom extends RoomEvent{
  final RoomDeleteRequest req;
  DeleteRoom(this.req);
}

class FetchData extends RoomEvent{}