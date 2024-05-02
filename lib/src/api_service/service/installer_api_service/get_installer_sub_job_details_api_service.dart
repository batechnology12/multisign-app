import 'dart:io';
import 'package:dio/dio.dart';
import 'package:multisign_app/src/api_service/baseurl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InstallerSubJobDetailsServicesApi extends BaseApiService {
  Future installerSubJobdetailsApi({
    required String id,
  }) async {
    dynamic responseJson;
    try {
    var dio = Dio();
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? authtoken = prefs.getString('auth_token');
        
        FormData formdata = FormData.fromMap({
            "id": id,
        });
      var response = await dio.post(getinstallersubjobdetailsURI,
    
          options: Options(
              headers: {
                'Accept': 'application/json',
                'Authorization': 'Bearer $authtoken',
              },
              followRedirects: false,
              validateStatus: (status) {
                return status! <= 500;
              }),
          data: formdata);
      print("::::::::<get installer sub job details Api>::${id}::::::status code::::::::::");
      print(response.statusCode);
      print(response.data);
      responseJson = response;
    } on SocketException {
      print("no internet");
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
