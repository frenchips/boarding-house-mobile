import 'package:ada_kost/model/homeRequest/home_order_request.dart';
import 'package:ada_kost/model/homeRequest/home_request.dart';
import 'package:ada_kost/model/homeResponse/home_amt_person_response.dart';
import 'package:ada_kost/model/homeResponse/home_loaded_response.dart';
import 'package:ada_kost/model/homeResponse/home_payment_status_response.dart';
import 'package:ada_kost/model/homeResponse/home_response.dart';

class HomeState{}

class HomeInitial extends HomeState{}

class HomeLoading extends HomeState{}

class HomeLoadingMore extends HomeState{}

class FetchSearchHome extends HomeState{
  final HomeOrderResponse response;
  FetchSearchHome(this.response);
}

class FetchDataParameterLoaded extends HomeState{
  List<Data> pay;
  FetchDataParameterLoaded(this.pay);
}

class FetchDataAmountLoaded extends HomeState{
  List<Amount> amt;
  FetchDataAmountLoaded(this.amt);
}

class FetchPay extends HomeState{
  final PaymentStatusResponse response;
  FetchPay(this.response);
}

class FetchHomeSuccess extends HomeState{
  final List<HomeOrderResponse> response;
  FetchHomeSuccess(this.response);
}

class SuccessLoadMore extends HomeState{
  final List<HomeOrderResponse> respon;
  SuccessLoadMore(this.respon);
}

class FetchRoomLoaded extends HomeState{
  final LoadedRoomResponse response;
  FetchRoomLoaded(this.response);
}

class SaveOrderSuccess extends HomeState{
  final HomeOrderResponse response;
  SaveOrderSuccess(this.response);
}

class SaveDetailPersonState extends HomeState{
  final ListPerson listPersonState;
  SaveDetailPersonState(this.listPersonState);
}