import 'package:pagination/servicedata/custom_exception.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ErrorHandle {
  static dynamic returnResponse(http.Response response, var jsonData) {
    print("request   ===>  ${response.request}");
    print("response   ===>  ${response.body}");

    var responseJson = json.decode(response.body);
    switch (response.statusCode) {
      case 200:

        if(responseJson["Status"]==200){
          return jsonData(response.body);}

        throw BadRequestException(responseJson["Message"]);
        //responseJson = signInResponseFromJson(response.body);

      case 400:
        throw BadRequestException(responseJson["Message"]);
      case 401:
        throw BadRequestException(responseJson["Message"]);
      case 403:
        throw UnauthorisedException(responseJson["Message"]);
      case 500:
        throw UnauthorisedException("Internal Server error");
      default:
        throw FetchDataException(
            'Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
