import 'package:get/get.dart';
import 'package:multisign_app/src/api_service/service/profile_api_service/profile_api_service.dart';
import 'package:multisign_app/src/const/bottom_navi_bar.dart';
import 'package:multisign_app/src/model/get_profile_model.dart';
import 'package:dio/dio.dart' as dio;
class ProfileController extends GetxController{


   ProfileApiServices profileApiServices = ProfileApiServices();
  Data ? getprofileData;
  getprofile() async {
  
    update();
    dio.Response<dynamic> response =
        await profileApiServices.getProfileApiServices();
   // isLoadingdatails(false);
    update();
    print('========================data==2=================================');
    if (response.data["status"] == true) {
      GetProfileModel getProfileModel =
          GetProfileModel.fromJson(response.data);
      getprofileData = getProfileModel.data;
    }else if(response.statusCode == 401){
       Get.offAll(BottomNaviBar());
    }
    update();
  }


}