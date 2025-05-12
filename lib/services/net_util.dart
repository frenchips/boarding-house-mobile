
import 'package:ada_kost/services/app_exception.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkUtil{
  Future<dynamic> post (String url, {Map<String, String>?headers, Map<String, dynamic>? body}) async{
    print(url);
    print(body);
    String jsonBody = json.encode(body);
    Uri uri = Uri.parse(url);
     return await http
        .post(uri, headers: headers,  body: jsonBody)
        .then((http.Response response) => _returnResponse(response));
  }


  Future<dynamic> add (String url,{Map<String, String>?headers , Map<String, dynamic>? body}) {
    print(body);
    String jsonBody = json.encode(body);
    Uri uri = Uri.parse(url);
    print(uri); 
     return  http
        .post(uri, headers: headers,  body: jsonBody)
        .then((http.Response response) => _returnResponse(response));
  }


  Future<dynamic> get(String url,
      {Map<String, String>? headers, Map<String, dynamic>? body})  {
        
    String jsonBody = json.encode(body);
    print(jsonBody);
    Uri apiUrl = Uri.parse(url);
    return  http
        .post(apiUrl, headers: headers, body: jsonBody)
        .then((http.Response response) => _returnResponse(response));
  }

  Future<dynamic> getData(String url,
      {Map<String, String>? headers, })  {
        
    // String jsonBody = json.encode(body);
    // print(jsonBody);
    Uri apiUrl = Uri.parse(url);
    return  http
        .get(apiUrl, headers: headers,)
        .then((http.Response response) => _returnResponse(response));
  }

   Future<dynamic> delete(String url,
      {Map<String, String>? headers, Map<String, dynamic>? body})  {
        
    String jsonBody = json.encode(body);
    print(jsonBody);
    Uri apiUrl = Uri.parse(url);
    return  http
        .post(apiUrl, headers: headers, body: jsonBody)
        .then((http.Response response) => _returnResponse(response));
  }

    dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson;
        if (response.body is String && response.body.isNotEmpty) {
          responseJson = json.decode(response.body.toString());
        } else {
          responseJson = response.body;
        }
        return responseJson;
      case 201:
        var responseJson;
        if (response.body is String && response.body.isNotEmpty) {
          responseJson = json.decode(response.body.toString());
        } else {
          responseJson = response.body;
        }
        return responseJson;
      case 400:
        var responseJson = json.decode(response.body.toString());
        throw BadRequestException(responseJson['message']);
      case 401:
        throw RefreshTokenFailedException('Response 401');
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
        var responseJson = json.decode(response.body.toString());
        throw FetchDataException(responseJson['message']);
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}