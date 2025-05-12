import 'package:ada_kost/model/roomrequest/room_model_add.dart';
import 'package:ada_kost/model/roomrequest/room_request_delete.dart';
import 'package:ada_kost/model/roomrequest/room_request_search.dart';
import 'package:ada_kost/model/roomresponse/room_response.dart';
import 'package:ada_kost/model/roomresponse/room_response_search.dart';
import 'package:ada_kost/services/restapi.dart';
import 'package:ada_kost/state_management/blocroom/event_room.dart';
import 'package:ada_kost/state_management/blocroom/state_room.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoomBloc extends Bloc<RoomEvent, RoomState> {
  Restapi api = Restapi();
  RoomModelResponse response = RoomModelResponse();
  RoomSearchResponse searchResp = RoomSearchResponse();
  List<ListData> listResp = [];
  late String id;
  int pageNo = 1;
  bool isLoadPage = true;

  RoomBloc() : super(RoomInitial()) {
    on<RoomEvent>((event, emit) async {
  
      try {
        if (event is CreateRoom) {
          emit(RoomLoading());
          response = await createRoom(event.model);
          emit(RoomAddSuccess(response));
        }
        // else if (event is LoadRoomData){
        //   // emit(RoomLoadingPage());
        //   // await Future.delayed(Duration(seconds: 2));
        //   // searchResp = await viewDataResp(event.req);
        //   // emit(FetchSuccessLoadMore(listResponse: searchResp.listData!, hashReachedMax: searchResp.listData!.length < 10));
        //   final currentState = state as FetchSuccessLoadMore;
        //   searchResp = await viewDataResp(event.req);
        //   emit(FetchSuccessLoadMore(listResponse: currentState.listResponse + searchResp.listData!, hashReachedMax: searchResp.listData!.length < 5));
        // } 
        else if (event is FetchRoomData){
          emit(RoomLoading());
          searchResp = await viewDataResp(event.req);
          emit(ViewSuccessRoom(searchResp));
        } else if (event is DeleteRoom){
          emit(RoomLoading());
          id = await deleteRoomResp(event.req);
        }
      } catch (e) {
        emit(RoomError(e.toString()));
      }
    });
  }

  createRoom(RoomModelRequest model) async {
    RoomModelResponse response = RoomModelResponse();
    response = await api.addRoom(model);
    return response;
  }

  viewDataResp(RoomSearchRequest data) async{
    RoomSearchResponse response = RoomSearchResponse();
    response = await api.viewRoom(data.toJson());
    // if(response.listData!.length < data.pageSize!.toInt()){
    //   isLoadPage = false;
    // } else {
    //   isLoadPage = true;
    // }
    return response;
  }

  deleteRoomResp(RoomDeleteRequest req) async{
    await api.deleteRoom(req.toJson());
    // return respId;
  }
}
