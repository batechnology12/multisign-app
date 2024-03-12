import 'dart:io';
import 'dart:typed_data';
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
import 'package:multisign_app/src/api_service/service/installer_api_service/get_installer_sub_job_api_service.dart';
import 'package:multisign_app/src/api_service/service/installer_api_service/verify_installation_api_service.dart';
import 'package:multisign_app/src/api_service/service/recee_api_servie/get_recee_api_service.dart';
import 'package:multisign_app/src/api_service/service/recee_api_servie/get_recee_details_api_service.dart';
import 'package:multisign_app/src/api_service/service/recee_api_servie/get_recee_sub_job_api_service.dart';
import 'package:multisign_app/src/api_service/service/recee_api_servie/get_recee_sub_jobdetails_api_service.dart';
import 'package:multisign_app/src/api_service/service/recee_api_servie/recee_sub_job_verify.dart';
import 'package:multisign_app/src/api_service/service/recee_api_servie/verify_recee_api_service.dart';
import 'package:multisign_app/src/const/app_colors.dart';
import 'package:multisign_app/src/const/app_constant.dart';
import 'package:multisign_app/src/const/bottom_navi_bar.dart';
import 'package:multisign_app/src/model/Get_installer_details_model.dart';
import 'package:multisign_app/src/model/get_details_recee_model.dart';
import 'package:multisign_app/src/model/get_installer_sub_job_model.dart';
import 'package:multisign_app/src/model/get_intaller_model.dart';
import 'package:multisign_app/src/model/get_recee_model.dart';
import 'package:multisign_app/src/model/get_recee_sub_job.dart';
import 'package:multisign_app/src/model/get_sub_jobdetails_model.dart';
import 'package:multisign_app/src/model/home_model.dart';
import 'package:multisign_app/src/views/Image_view/local_image_view.dart';
import 'package:multisign_app/src/views/installation_customer_view/installation_report_Details.dart';
import 'package:multisign_app/src/views/recce_customer_view/recce_report_details.dart';

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
    // installerListdata.clear();
    isLoading(true);
    update();
    dio.Response<dynamic> response =
        await getInstallerApiServices.getInstallerApiServices();
    isLoading(false);
    update();
    if (response.data["status"] == true) {
      GetInstallerModel getInstallerModel =
          GetInstallerModel.fromJson(response.data);
      installerListdata = getInstallerModel.data;
    }
    update();
  }

  GetReceeApiServices getReceeApiServices = GetReceeApiServices();
  List<GetReceDataList> getreceelistData = [];
  getRecee() async {
    //  getreceelistData.clear();
    isLoading(true);
    update();
    dio.Response<dynamic> response =
        await getReceeApiServices.getReceeApiServices();
    isLoading(false);
    update();
    if (response.data["status"] == true) {
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
    if (response.data["status"] == true) {
      GetIReceeDetailsModel geRreceedetailModel =
          GetIReceeDetailsModel.fromJson(response.data);
      getreceedetailsData = geRreceedetailModel.data;
    }
    update();
  }

  GetReceeSubjobApiServices getReceeSubjobApiServices =
      GetReceeSubjobApiServices();

  List<Datum> getreceedsubjobData = [];
  getReceesubjob({required String id}) async {
    print(
        '========================data==1==========${id}=======================');
    isLoadingdatails(true);
    update();
    dio.Response<dynamic> response =
        await getReceeSubjobApiServices.getReceesubjobApiServices(id: id);
    isLoadingdatails(false);
    update();
    print('========================data==2=================================');
    if (response.data["status"] == true) {
      GetReceeSubjob getReceeSubjob = GetReceeSubjob.fromJson(response.data);
      getreceedsubjobData = getReceeSubjob.data;
    } else {
      getReceedetails(id: id);
      Get.off(RecceReportDetails(
        id: id,
        flag: false,
      ));
    }
    update();
  }

  GetInstallerSubjobApiServices getInstallerSubjobApiServices =
      GetInstallerSubjobApiServices();

  List<InstallerSubJobDataList> getinstallersubjobData = [];
  getinstallersubjob({required String id}) async {
    print(
        '========================data==1==========${id}=======================');
    isLoadingdatails(true);
    update();
    dio.Response<dynamic> response = await getInstallerSubjobApiServices
        .getInstallersubjobApiServices(id: id);
    isLoadingdatails(false);
    update();
    print('========================data==2=================================');
    if (response.data["status"] == true) {
      GetInstallerSubJobModel getInstallerSubjob =
          GetInstallerSubJobModel.fromJson(response.data);
      getinstallersubjobData = getInstallerSubjob.data;
    } else {
      getinstallerdetails(id: id);
      Get.off(InstallationReportDetails(
        id: id,
        flag: false, beforeImages: [],
      ));
    }
    update();
  }

  ReceeSubJobDetailsServicesApi receeSubJobDetailsServicesApi =
      ReceeSubJobDetailsServicesApi();

  //subjobdatailsdata? getReceesubjobdetailsData;
  getReceesubjobDetails({required String id}) async {
    print(
        '========================data==1==========${id}=======================');
    isLoadingdatails(true);
    update();
    dio.Response<dynamic> response =
        await receeSubJobDetailsServicesApi.receeSubJobdetailsApi(id: id);
    isLoadingdatails(false);
    update();
    print('========================data==2=================================');
    if (response.data["status"] == true) {
      GetIReceeDetailsModel geRreceedetailModel =
          GetIReceeDetailsModel.fromJson(response.data);
      getreceedetailsData = geRreceedetailModel.data;
    } else {}
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
    if (response.data["status"] == true) {
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
    required List<Uint8List?> media,
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
      pickedEditedImagePathList.clear();
      Get.to(BottomNaviBar());
      pickedImagePathList.clear();
      pickedImagePath != '';
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
        headText: "Upload Failed",
        content: response.data['message'],
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

  VerifyReceeSubjobApiServices verifyReceeSubjobApiServices =
      VerifyReceeSubjobApiServices();

  verifysubjobRecee({
    required String job_card,
    required String width,
    required String height,
    required String squrefit,
    required String dimension,
    required String signage_type,
    required String signage_details,
    required String client_id,
    required List<Uint8List?> media,
  }) async {
    isLoadingverification(true);
    update();
    dio.Response<dynamic> response =
        await verifyReceeSubjobApiServices.varifyreceeSubJobApi(
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
      pickedEditedImagePathList.clear();
      Get.to(BottomNaviBar());
      pickedImagePathList.clear();
      pickedImagePath != '';
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
        headText: "Upload Failed",
        content: response.data['message'],
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
    required List<Uint8List?> media,
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
      pickedEditedImagePathList.clear();
      pickedImagePath!.isEmpty;
      print(
          '======================${pickedImagePath}==========================');
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
    pickedEditedImagePathList.isEmpty;
    update();
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
        compressQuality: 50,
        aspectRatioPresets: [
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.original,
        ],
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

      // cameraimagePath.value = croppedFile1!.path;
      Get.to(() => FlutterPainterExample(
            image: croppedFile1.path,
          ));
      // pickedImagePathList = [croppedFile1.path];
      // pickedEditedImagePathList = []
      // pickedImagePathList.add(croppedFile1!.path);
      pickedImagePath == null;
      update();
      //   pickedImagePath==null;
      // print(
      //   'picked image size ${cameraimage!.lengthSync()}',
      // );
    } else {}
  }

  final picker = ImagePicker();
  List<String> pickedImagePathList = [];
  List<Uint8List?> pickedEditedImagePathList = [];
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
        compressQuality: 70,
        aspectRatioPresets: [
          CropAspectRatioPreset.ratio7x5,
          CropAspectRatioPreset.original
        ],
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
      Get.to(() => FlutterPainterExample(
            image: croppedFile.path,
          ));
      // //  image = croppedFile;

      // //  _pickedImage = File(pickedFile.path);

      // _pickedImagePath.value = croppedFile!.path;

      // // pickedImagePathList.add(croppedFile!.path);
      // pickedImagePathList = [croppedFile.path];
      // update();
      //   print(
      //   'picked image size ${_pickedImage!.lengthSync()}',
      // );
    } else {}
  }

  // addImages(photos) {
  //  cameraImages.
  //   update();
  // }

  List<Datum> searchList = [];

  searchCookBook({required String query}) {
    if (searchList.isEmpty) {
      // Store the original list if it's empty
      searchList = getreceedsubjobData;
      update();
    }

    if (query.isEmpty) {
      // If the query is empty, restore the original list
      getreceedsubjobData = searchList;
    } else {
      // If the query is not empty, filter the original list based on the query
      List<Datum> searchResults = searchList
          .where((obj) =>
              obj.clientName.toLowerCase().contains(query.toLowerCase()))
          .toList();
      getreceedsubjobData = searchResults;
      update();
    }

    getreceedsubjobData;
    update();
  }
}
