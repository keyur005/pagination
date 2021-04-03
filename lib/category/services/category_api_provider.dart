import 'dart:io';

import 'package:pagination/category/model/category_response.dart';
import 'package:pagination/servicedata/custom_exception.dart';

import 'package:pagination/servicedata/response_error.dart';


import 'package:http/http.dart' as http;

class ProductApiProvider {




  var updateResponse;
  Future<CategoryResponse>  categoryUpdate(String id, String device, String model,
       String token, int page) async{


    String request = '{"CategoryId": 0,'
        '"DeviceManufacturer":"Google",'
        '"DeviceModel":"Android",'
        '"DeviceToken":"",'
        '"PageIndex":$page}';
    print(request.toString());




    try{
      var response = await http.post(
          "http://esptiles.imperoserver.in/api/API/Product/DashBoard",
          body: request,

          headers:{ 'Content-type': 'application/json',
           });

      print("Response   " +response.statusCode.toString());
      updateResponse = ErrorHandle.returnResponse(response,productResponseFromJson);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }

    return updateResponse;

  }}









