import 'dart:io';

import 'package:dio/dio.dart';
import 'package:multisign_app/src/api_service/baseurl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetReceeSignangeDetailsApiService extends BaseApiService{

  Future getReceeSignangeDetailsApi()async{
    dynamic responseJson;
    try{
      var dio = Dio();
      final prefs = await SharedPreferences.getInstance();
      String? authtoken = prefs.getString('auth_token');
        print('-------------------------------------${authtoken}=========================================');
      print(authtoken);

      var response = await dio.get(getreceesignageDetailsURL,
      options: Options(
        headers: {
          'Accepet':'application/json',
          "AUthorization":'Bearer $authtoken',
          
        },
        followRedirects: false,
        validateStatus: (status){
          return status!<=500;
          
        },
        
      ),
      
      );
      print('::::::::::::::::::<GetRecee SignageDetails Api Service>:::::::::::status code:::::::::');
      print(response.data);
      print(response.statusCode);
      responseJson = response;

    }
    on SocketException{
      print('no internet');
    }
    return responseJson;
  }
    dynamic returnResponse(Response<dynamic> response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = response.data;
        print("here.>>>>>>>>>>>>");
        return responseJson;
      case 400:
      // throw BadRequestException(response.body.toString());
      case 401:
      case 403:
      // throw UnauthorisedException(response.body.toString());
      case 404:
      // throw UnauthorisedException(response.body.toString());
      case 500:
      default:
      // throw FetchDataException(
      //     'Error occured while communication with server' +
      //         ' with status code : ${response.statusCode}');
    }
  }
}