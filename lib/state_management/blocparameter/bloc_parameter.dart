import 'package:ada_kost/model/parameterRequest/parameter_request.dart';
import 'package:ada_kost/model/parameterResponse/parameter_response.dart';
import 'package:ada_kost/services/restapi.dart';
import 'package:ada_kost/state_management/blocparameter/event_parameter.dart';
import 'package:ada_kost/state_management/blocparameter/state_parameter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ParameterBloc extends Bloc<ParameterEvent, ParameterState> {
  Restapi api = Restapi();

  bool isLoadingMore = false;

  ParameterSearchResponse searchResponse = ParameterSearchResponse();

  ParameterSearchRequest searchReq = ParameterSearchRequest();

  List<ListData> responseParam = [];

  ParameterBloc() : super(ParameterInitial()) {
    on<ParameterEvent>((event, emit) async {
      try {

        if(event is FetchParameterData){
          emit(ParameterLoading());
          searchResponse = await fetchAllParameter(event.request);  
          emit(FetchSuccess(searchResponse));
        }
        else if (event is FetchParameterLoaded) {
          emit(FetchParameterLoadMore());
          await Future.delayed(const Duration(seconds: 2));
          event.request.pageNo = (event.request.pageNo ?? 1) + 1;
          searchResponse = await fetchAllParameter(event.request);
          emit(FetchSuccessLoadMore(searchResponse));
        } 
        //else if (event is FetchParameterData){
        //   emit(ParameterLoading());
        //   await fetchAllParameter(event.request);
        //   emit(FetchParameterSuccess(responseParam));
        // }
      } catch (e) {}
      // TODO: implement event handler
    });
  }

  fetchAllParameter(ParameterSearchRequest data) async {
    ParameterSearchResponse responData = await api.fetchParameter(data.toJson());

  
    // (responData['listData']).forEach((element) {
    //   responseParam.add(ListData.fromJson(element));
    // });

    if (responData.listData!.length < data.pageSize!.toInt()) {
      isLoadingMore = false; // Tidak ada lebih banyak data yang bisa dimuat
    } else {
      isLoadingMore = true;
    }

    return responData;
  }

  fetchParameterLoadMore() async {
    if (isLoadingMore == false) {
      final map = await api.fetchParameter(searchReq.toJson());
      List<ListData> resp = [];
      (map['listData']).forEach((element) {
        resp.add(ListData.fromJson(element));
      });

      if (responseParam.length < searchReq.pageSize!.toInt()) {
        isLoadingMore = true; // Tidak ada lebih banyak data yang bisa dimuat
      }

      responseParam.addAll(resp);
    }
  }
}
