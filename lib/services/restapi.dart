
import 'package:ada_kost/model/homeRequest/home_order_request.dart';
import 'package:ada_kost/model/homeRequest/home_request.dart';
import 'package:ada_kost/model/homeResponse/home_amt_person_response.dart';
import 'package:ada_kost/model/homeResponse/home_loaded_response.dart';
import 'package:ada_kost/model/homeResponse/home_payment_status_response.dart';
import 'package:ada_kost/model/homeResponse/home_response.dart';
import 'package:ada_kost/model/homeResponse/home_save_order_response.dart';
import 'package:ada_kost/model/parameterResponse/parameter_response.dart';
import 'package:ada_kost/model/roomrequest/room_model_add.dart';
import 'package:ada_kost/model/roomresponse/room_response.dart';
import 'package:ada_kost/model/roomresponse/room_response_search.dart';
import 'package:ada_kost/screen/users/model/create_user.dart';
import 'package:ada_kost/services/api_url.dart';
import 'package:ada_kost/services/net_util.dart';

class Restapi extends UrlApi {
  NetworkUtil util = new NetworkUtil();

  // Future<dynamic> login({Map<String, dynamic>? body}) {
  //   return util
  //       .post(
  //     baseUrl + '/api/users',
  //     body: body,
  //   )
  //       .then((value) {
  //     print(value.toString());
  //     return value;
  //   });
  // }

  // Room
  Future<dynamic> addRoom(RoomModelRequest model) {
    return util.add(  
       baseUrl + "/addRoom",
      headers: {'Content-Type': 'application/json'},
      body: model.toJson()
    ).then((dynamic res) {
      if (res["errMsg"] != null) throw (res["errMsg"].toString());
        return RoomModelResponse.fromJson(res);
    },);
  }


  Future<dynamic> viewRoom(Map<String,dynamic> body) {
    return util.get(  
       baseUrl + "/searchRoom",
      headers: {'Content-Type': 'application/json'},
      body: body,
    ).then((dynamic res) {
      if (res["errMsg"] != null) throw (res["errMsg"].toString());
        return RoomSearchResponse.fromJson(res);
    },);
  }

  Future<dynamic> getPaymentParameter() {
    return util.getData(  
       baseUrl + "/getAllByParameterByPay",
      headers: {'Content-Type': 'application/json'},
      // body: body,
    ).then((dynamic res) {
      if (res["errMsg"] != null) throw (res["errMsg"].toString());
        return PaymentStatusResponse.fromJson(res);
    },);
  }

  Future<dynamic> getGenderParameter() {
    return util.getData(  
       baseUrl + "/getAllByParameterByGender",
      headers: {'Content-Type': 'application/json'},
      // body: body,
    ).then((dynamic res) {
      if (res["errMsg"] != null) throw (res["errMsg"].toString());
        return PaymentStatusResponse.fromJson(res);
    },);
  }

  Future<dynamic> addOrder(String id, HomeSaveOrderRequest model) {
    return util.add(  
       baseUrl + "/saveOrder/$id",
      headers: {'Content-Type': 'application/json'},
      body: model.toJson()
    ).then((dynamic res) {
      if (res["errMsg"] != null) throw (res["errMsg"].toString());
        return HomeSaveOrderResponse.fromJson(res);
    },);
  }

  Future<dynamic> getAmountParameter() {
    return util.getData(  
       baseUrl + "/getAllByParameterByAmtPerson",
      headers: {'Content-Type': 'application/json'},
      // body: body,
    ).then((dynamic res) {
      if (res["errMsg"] != null) throw (res["errMsg"].toString());
        return AmountPersonResponse.fromJson(res);
    },);
  }

  Future<dynamic> getLoadedRoom(String id) {
    return util.getData(  
       baseUrl + "/getLoadedRoom/$id",
      headers: {'Content-Type': 'application/json'},
      // body: body,
    ).then((dynamic res) {
      if (res["errMsg"] != null) throw (res["errMsg"].toString());
        return LoadedRoomResponse.fromJson(res);
    },);
  }

  Future<dynamic> fetchHomeOrder(Map<String,dynamic> body) {
    return util.get(  
       baseUrl + "/findOrder",
      headers: {'Content-Type': 'application/json'},
      body: body,
    ).then((dynamic res) {
      if (res["errMsg"] != null) throw (res["errMsg"].toString());
        return HomeOrderResponse.fromJson(res);
    },);
  }

  Future<dynamic> deleteRoom(Map<String,dynamic> body) {
    return util.post(  
       baseUrl + "/deleteRoom",
      headers: {'Content-Type': 'application/json'},
      body: body
    ).then((dynamic res) {
      if (res["errMsg"] != null) throw (res["errMsg"].toString());
        return RoomSearchResponse.fromJson(res);
    },);
  }


  Future<dynamic> fetchParameter(Map<String,dynamic> body) {
    return util.post(  
       baseUrl + "/search",
      headers: {'Content-Type': 'application/json'},
      body: body
    ).then((dynamic res) {
      if (res["errMsg"] != null) throw (res["errMsg"].toString());
        return ParameterSearchResponse.fromJson(res);
    },);
  }
}
