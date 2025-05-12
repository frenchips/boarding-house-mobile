import 'package:ada_kost/model/roomrequest/room_request_delete.dart';
import 'package:ada_kost/model/roomresponse/room_response.dart';
import 'package:ada_kost/model/roomresponse/room_response_search.dart';

class RoomState {}

class RoomInitial extends RoomState {}

class RoomAddSuccess extends RoomState {
  final RoomModelResponse response;
  RoomAddSuccess(this.response);
}

class RoomLoading extends RoomState {}

class RoomLoadingPage extends RoomState {}

class RoomError extends RoomState {
  String message;
  RoomError(this.message);
}

class ViewSuccessRoom extends RoomState {
  final RoomSearchResponse response;
  // final int pageNo;
  ViewSuccessRoom(this.response);
}


class DeleteListRoom extends RoomState{
  final ListDelete listDelete;
  DeleteListRoom(this.listDelete);
}


class ViewErrorRoom extends RoomState {
  final String message;
  ViewErrorRoom(this.message);
}

class DeleteRoomSuccess extends RoomState {
  final String setCode;
  DeleteRoomSuccess(this.setCode);
}

class FetchSuccess extends RoomState{
  final List<ListData> listResponse;
  FetchSuccess(this.listResponse);
}

class FetchSuccessLoadMore extends RoomState{
  final List<ListData> listResponse;
  final bool hashReachedMax;
  FetchSuccessLoadMore({required this.listResponse, this.hashReachedMax = false});
}
