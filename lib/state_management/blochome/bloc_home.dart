import 'package:ada_kost/model/homeRequest/home_order_request.dart';
import 'package:ada_kost/model/homeRequest/home_request.dart';
import 'package:ada_kost/model/homeResponse/home_amt_person_response.dart';
import 'package:ada_kost/model/homeResponse/home_loaded_response.dart';
import 'package:ada_kost/model/homeResponse/home_payment_status_response.dart';
import 'package:ada_kost/model/homeResponse/home_response.dart';
import 'package:ada_kost/model/homeResponse/home_save_order_response.dart';
import 'package:ada_kost/services/restapi.dart';
import 'package:ada_kost/state_management/blochome/event_home.dart';
import 'package:ada_kost/state_management/blochome/state_home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  Restapi api = Restapi();
  HomeOrderResponse response = HomeOrderResponse();
  HomeOrderRequest req = HomeOrderRequest();
  PaymentStatusResponse paramResp = PaymentStatusResponse();
  AmountPersonResponse amtResp = AmountPersonResponse();
  LoadedRoomResponse loadRomResp = LoadedRoomResponse();
  HomeOrderResponse orderResp = HomeOrderResponse();
  List<HomeOrderResponse> responList = [];

  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      // TODO: implement event handler
      if(event is HomeOrderLoaded){
        emit(HomeLoading());
        await Future.delayed(Duration(seconds: 2));
        await fetchHomeOrder(event.request);
        emit(SuccessLoadMore(responList));
      }
      else if(event is FetchHomeOrderData){
        emit(HomeLoading());
        response = await fetchHomeOrder(event.request);
        emit(FetchSearchHome(response));
      } else if (event is FetchParam){
        emit(HomeLoading());
        paramResp = await fetchPay();
        emit(FetchDataParameterLoaded(paramResp.data!));
      } else if (event is FetchAmount){
        emit(HomeLoading());
        amtResp = await fetchAmt();
        emit(FetchDataAmountLoaded(amtResp.data!));
      } else if (event is FetchRoom){
        emit(HomeLoading());
        loadRomResp = await fetchRoomLoad(event.id);
        emit(FetchRoomLoaded(loadRomResp));
      } else if (event is SaveOrder){
        emit(HomeLoading());
        orderResp = await saveOrder(event.id, event.request);
        emit(SaveOrderSuccess(response));
      } else if (event is FetchGender){
        emit(HomeLoading());
        paramResp = await fetchGender();
        emit(FetchDataParameterLoaded(paramResp.data!));
      } else if (event is SaveDetailPerson){
        emit(HomeLoading());
        emit(SaveDetailPersonState(event.listPerson));
      }
    });
  }

  fetchHomeOrder(HomeOrderRequest req) async{
    HomeOrderResponse response = HomeOrderResponse();
    response = await api.fetchHomeOrder(req.toJson());
    return response;
  }

  fetchPay() async{
    PaymentStatusResponse response = PaymentStatusResponse();
    response = await api.getPaymentParameter();
    return response;
  }

  fetchGender() async{
    PaymentStatusResponse response = PaymentStatusResponse();
    response = await api.getGenderParameter();
    return response;
  }


  fetchAmt() async{
    AmountPersonResponse response = AmountPersonResponse();
    response = await api.getAmountParameter();
    return response;
  }

  fetchRoomLoad(String id) async{
    LoadedRoomResponse response = LoadedRoomResponse();
    response = await api.getLoadedRoom(id);
    return response;
  }

  saveOrder(String id, HomeSaveOrderRequest request) async{
    HomeSaveOrderResponse response = HomeSaveOrderResponse();
    response = await api.addOrder(id, request);
    return response;
  }
}