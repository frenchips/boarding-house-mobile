import 'package:ada_kost/model/homeRequest/home_order_request.dart';
import 'package:ada_kost/model/homeRequest/home_request.dart';
import 'package:ada_kost/model/homeResponse/home_response.dart';

class HomeEvent{}

class FetchParam extends HomeEvent{}

class FetchAmount extends HomeEvent{}

class FetchGender extends HomeEvent{}

class LoadInitialData extends HomeEvent{}

class LoadMoreData extends HomeEvent{}

class FetchRoom extends HomeEvent{
  String id;
  FetchRoom(this.id);
}

class FetchHomeOrderData extends HomeEvent{
  HomeOrderRequest request;
  FetchHomeOrderData(this.request);
}

class HomeOrderLoaded extends HomeEvent{
  HomeOrderRequest request;
  HomeOrderLoaded(this.request);
}

class SaveOrder extends HomeEvent{
  String id;
  HomeSaveOrderRequest request;
  SaveOrder(this.id, this.request);
}

class SaveDetailPerson extends HomeEvent{
  final ListPerson listPerson;
  SaveDetailPerson(this.listPerson);
}