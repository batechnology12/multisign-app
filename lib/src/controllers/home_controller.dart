


import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:multisign_app/src/api_service/service/installer_api_service/get_installer_api_service.dart';
import 'package:multisign_app/src/api_service/service/recee_api_servie/get_recee_api_service.dart';
import 'package:multisign_app/src/api_service/service/recee_api_servie/get_recee_details_api_service.dart';
import 'package:multisign_app/src/const/app_colors.dart';
import 'package:multisign_app/src/model/get_details_recee_model.dart';
import 'package:multisign_app/src/model/get_intaller_model.dart';
import 'package:multisign_app/src/model/get_recee_model.dart';
import 'package:multisign_app/src/model/home_model.dart';





class HomeController extends GetxController {
  List letters = ["AK", "WA", "JR", "JR"];
  List name = ["Aash Kumar", "Wasim Anas", "Jaga Raj", "Jaga Raj"];
  List place = ["Business Board, chennai"];
  List jobId = ['job Id: AKASH12345'];
  List date = ["08-12-2023"];
  List day = ["Friday"];
  List<Color> colors = [
    AppColors.pink,
    AppColors.red,
    AppColors.green,
    AppColors.grey.withOpacity(.43)
  ];

  List<ProjectDetails> projectDetails = [
    ProjectDetails(
        letters: "Ak",
        name: "Aash Kumar",
        place: "Business Board, chennai",
        jobId: 'job Id: AKASH12345',
        date: "08-12-2023",
        day: "Friday"),
    ProjectDetails(
        letters: "WA",
        name: "Wasim Anas",
        place: "Business Board, chennai",
        jobId: 'job Id: AKASH12345',
        date: "08-12-2023",
        day: "Friday"),
    ProjectDetails(
        letters: "JR",
        name: "Jaga Raj",
        place: "Business Board, chennai",
        jobId: 'job Id: AKASH12345',
        date: "08-12-2023",
        day: "Friday"),
    ProjectDetails(
        letters: "JR",
        name: "Jaga Raj",
        place: "Business Board, chennai",
        jobId: 'job Id: AKASH12345',
        date: "08-12-2023",
        day: "Friday"),
  ];
 RxBool isLoading = false.obs;
GetInstallerApiServices getInstallerApiServices=GetInstallerApiServices();
  List<InstallerListData> installerListdata = [];
  getinstallation() async {
    isLoading(true);
    update();
    dio.Response<dynamic> response =
        await getInstallerApiServices.getInstallerApiServices();
    isLoading(false);
    update();
    if (response.statusCode == 200) {
      GetInstallerModel getInstallerModel = GetInstallerModel.fromJson(response.data);
     installerListdata = getInstallerModel.data;
    }
    update();
  }



GetReceeApiServices getReceeApiServices=GetReceeApiServices();
  List<GetReceDataList> getreceelistData = [];
  getRecee() async {
    isLoading(true);
    update();
    dio.Response<dynamic> response =
        await getReceeApiServices.getReceeApiServices();
    isLoading(false);
    update();
    if (response.statusCode == 200) {
      GetReceeModel geRreceeModel = GetReceeModel.fromJson(response.data);
      getreceelistData = geRreceeModel.data;
    }
    update();
  }





ReceeDetailsServicesApi receeDetailsServicesApi=ReceeDetailsServicesApi();
  GetReceeDetilsList? getreceedetailsData ;
  getReceedetails({required int id}) async {
    isLoading(true);
    update();
    dio.Response<dynamic> response =
        await receeDetailsServicesApi.receedetailsApi(id: id);
    isLoading(false);
    update();
    if (response.statusCode == 200) {
      GetIReceeDetailsModel geRreceedetailModel = GetIReceeDetailsModel.fromJson(response.data);
      getreceedetailsData = geRreceedetailModel.data;
    }
    update();
  }





  // addImages(photos) {
  //  cameraImages.
  //   update();
  // }
}
