import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multisign_app/src/api_service/service/installer_api_service/get_installer_api_service.dart';
import 'package:multisign_app/src/api_service/service/installer_api_service/get_installer_details_api_service.dart';
import 'package:multisign_app/src/api_service/service/installer_api_service/verify_installation_api_service.dart';
import 'package:multisign_app/src/api_service/service/recee_api_servie/get_recee_api_service.dart';
import 'package:multisign_app/src/api_service/service/recee_api_servie/get_recee_details_api_service.dart';
import 'package:multisign_app/src/api_service/service/recee_api_servie/verify_recee_api_service.dart';
import 'package:multisign_app/src/const/app_colors.dart';
import 'package:multisign_app/src/const/app_constant.dart';
import 'package:multisign_app/src/const/bottom_navi_bar.dart';
import 'package:multisign_app/src/model/Get_installer_details_model.dart';
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
  RxBool isLoadingdatails = false.obs;
  RxBool isLoadingverification = false.obs;

  GetInstallerApiServices getInstallerApiServices = GetInstallerApiServices();
  List<intallerListData> installerListdata = [];
  getinstallation() async {
    isLoading(true);
    update();
    dio.Response<dynamic> response =
        await getInstallerApiServices.getInstallerApiServices();
    isLoading(false);
    update();
    if (response.statusCode == 200) {
      GetInstallerModel getInstallerModel =
          GetInstallerModel.fromJson(response.data);
      installerListdata = getInstallerModel.data;
    }
    update();
  }

  GetReceeApiServices getReceeApiServices = GetReceeApiServices();
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

  ReceeDetailsServicesApi receeDetailsServicesApi = ReceeDetailsServicesApi();
  Data? getreceedetailsData;
  getReceedetails({required String id}) async {
    print(
        '========================data==1==========${id}=======================');
    isLoadingdatails(true);
    update();
    dio.Response<dynamic> response =
        await receeDetailsServicesApi.receedetailsApi(id: id);
    isLoadingdatails(false);
    update();
    print('========================data==2=================================');
    if (response.statusCode == 200) {
      GetIReceeDetailsModel geRreceedetailModel =
          GetIReceeDetailsModel.fromJson(response.data);
      getreceedetailsData = geRreceedetailModel.data;
    }
    update();
  }

  InstallerDetailsServicesApi installerDetailsServicesApi =
      InstallerDetailsServicesApi();
  installerData? getinstallerdetailsData;
  getinstallerdetails({required String id}) async {
    print(
        '========================data==1==========${id}=======================');
    isLoadingdatails(true);
    update();
    dio.Response<dynamic> response =
        await installerDetailsServicesApi.installerdetailsApi(id: id);
    isLoadingdatails(false);
    update();
    print('========================data==2=================================');
    if (response.statusCode == 200) {
      GetIInstallerDetailsModel geInstallerdetailModel =
          GetIInstallerDetailsModel.fromJson(response.data);
      getinstallerdetailsData = geInstallerdetailModel.data;
    }
    update();
  }

  VerifyReceeApiServices verifyReceeApiServices = VerifyReceeApiServices();

  verifyRecee({
    required String job_card,
    required String width,
    required String height,
    required String squrefit,
    required String dimension,
    required String signage_type,
    required String signage_details,
    required String client_id,
    required List<String> media,
  }) async {
    isLoadingverification(true);
    update();
    dio.Response<dynamic> response =
        await verifyReceeApiServices.varifyreceeApi(
      job_card: job_card,
      width: width,
      height: height,
      squrefit: squrefit,
      dimension: dimension,
      signage_type: signage_type,
      signage_details: signage_details,
      client_id: client_id,
      media: media,
    );
    isLoadingverification(false);
    if (response.data['status'] == true) {
      Get.to(BottomNaviBar());
      pickedImagePathList.clear();
       pickedImagePath!='';
       update();
      AppConstant.showSnackbar(
        headText: "Successful",
        content: "Uploaded successfull",
        position: SnackPosition.BOTTOM,
      );
      // Get.showSnackbar(
      //   messageText: const Text(
      //     "Uploaded successfull",
      //     style: TextStyle(color: Colors.white),
      //   ),
      //   backgroundColor: Colors.green,
      // );
    } else {
      AppConstant.showSnackbar(
        headText: "Failed",
        content: "Something went wrong",
        position: SnackPosition.BOTTOM,
      );
      // Get.showSnackbar(
      //   messageText: const Text(
      //     "Something went wrong",
      //     style: TextStyle(color: Colors.white),
      //   ),
      //   backgroundColor: Colors.red,
      // );
    }
  }

  VerifyInstallationApiServices verifyInstallationApiServices =
      VerifyInstallationApiServices();

  verifyInstall({
    required String job_card,
    required List<String> media,
    //  required String media1,
  }) async {
    isLoadingverification(true);
    update();
    dio.Response<dynamic> response =
        await verifyInstallationApiServices.varifyInastallatinApi(
      job_card: job_card,

      media: media,
      //    media1: media1
    );
    isLoadingverification(false);


    if (response.data['status'] == true) {
      Get.to(BottomNaviBar());
       pickedImagePathList.clear();
       pickedImagePath!.isEmpty;
       print('======================${pickedImagePath}==========================');
      Get.rawSnackbar(
        messageText: const Text(
          "Uploaded successfull",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      );
    } else {
      Get.rawSnackbar(
        messageText: const Text(
          "Something went wrong",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      );
    }
  }

  final camera = ImagePicker();

  File? cameraimage;
  final cameraimagePath = ''.obs;

  File? get pickedcameraimage => cameraimage;
  String? get pickedcamerapath => cameraimagePath.value;

  void setImagesEmpty() {
    cameraimagePath.value = '';
  }

  Future CameraImage({
    required ImageSource imageSource,
  }) async {
    final pickedCamerafile = await camera.pickImage(
      source: ImageSource.camera,
    );

    if (pickedCamerafile != null) {
      print('=========================================');
      final croppedcam = await ImageCropper().cropImage(
        sourcePath: pickedCamerafile!.path,
        aspectRatioPresets: [CropAspectRatioPreset.ratio7x5],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Cropper',
              toolbarColor: AppColors.blue,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: 'Cropper',
          ),
          // WebUiSettings(
          //   context: context,
          // ),
        ],
      );
      if (croppedcam == null) return;

      final croppedFile1 = File(croppedcam!.path);

      //cameraimage = File(pickedCamerafile.path);

      cameraimagePath.value = croppedFile1!.path;
      pickedImagePathList.add(croppedFile1!.path);
       pickedImagePath==null;
      update();
   //   pickedImagePath==null;
      print(
        'picked image size ${cameraimage!.lengthSync()}',
      );
    } else {}
  }

  final picker = ImagePicker();
  List<String> pickedImagePathList = [];
  File? _pickedImage;
  final _pickedImagePath = ''.obs;

  File? get pickedImage => _pickedImage;
  String? get pickedImagePath => _pickedImagePath.value;

  void setImagePathEmpty() {
    _pickedImagePath.value = '';
  }

  Future pickImage({
    required ImageSource imageSource,
  }) async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      final croppedImage = await ImageCropper().cropImage(
        sourcePath: pickedFile!.path,
        aspectRatioPresets: [CropAspectRatioPreset.ratio7x5],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Cropper',
              toolbarColor: AppColors.blue,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: 'Cropper',
          ),
          // WebUiSettings(
          //   context: context,
          // ),
        ],
      );

      if (croppedImage == null) return;

      final croppedFile = File(croppedImage.path);

      //  image = croppedFile;

      //  _pickedImage = File(pickedFile.path);

      _pickedImagePath.value = croppedFile!.path;
      pickedImagePathList.add(croppedFile!.path);
      update();
        print(
        'picked image size ${_pickedImage!.lengthSync()}',
      );
    } else {}
  }

  // addImages(photos) {
  //  cameraImages.
  //   update();
  // }
}
