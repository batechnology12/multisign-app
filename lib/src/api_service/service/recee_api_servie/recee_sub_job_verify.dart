import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:multisign_app/src/api_service/baseurl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VerifyReceeSubjobApiServices extends BaseApiService {
  
  Future varifyreceeSubJobApi({
    required String jobcard,
    required String width,
    required String height,
    required String squrefit,
    required String dimension,
    required String quantity,
    required String signage_type,
    required String signage_details,
    required String client_id,
    required List<Uint8List?> media,
  }) async {
    dynamic responseJson;
    try {
      var dio = Dio();
      final prefs = await SharedPreferences.getInstance();
      String? authtoken = prefs.getString("auth_token");

      FormData formData = FormData.fromMap({
        "job_card": jobcard,
        "width": width,
        "height": height,
        "squrefit": squrefit,
        "qty":quantity,
        "dimension": dimension,
        "signage_type": signage_type,
        "signage_details": signage_details,
        "client_id": client_id,
        for (int i = 0; i < media.length; i++)
          "before_images[$i]":
               MultipartFile.fromBytes(media[i]!, filename: "image$i"),
      });

      var response = await dio.post(
        receesubjobverify,
          options: Options(
              headers: {
                'Accept': 'application/json',
                'Authorization': 'Bearer $authtoken',
              },
              followRedirects: false,
              validateStatus: (status) {
                return status! <= 500;
              }),
          data: formData);
      print("::::::::<Upload RECEE sub job>::::::::status code:::::::::");
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
