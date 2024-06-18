import 'dart:io';
import 'dart:typed_data';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:multisign_app/src/const/app_colors.dart';
import 'package:multisign_app/src/const/app_constant.dart';
import 'package:multisign_app/src/const/app_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multisign_app/src/const/bottom_navi_bar.dart';
import 'package:multisign_app/src/controllers/home_controller.dart';
import 'package:multisign_app/src/model/get_recee_signagedetails_model.dart';
import 'package:shimmer_pro/shimmer_pro.dart';

class RecceReportDetails extends StatefulWidget {
  final String id;

  const RecceReportDetails({
    super.key,
    required this.id,
  });

  @override
  State<RecceReportDetails> createState() => _RecceReportDetailsState();
}

class _RecceReportDetailsState extends State<RecceReportDetails> {
  final _focusNode = FocusNode();
  final TextEditingController job_cardContoller = TextEditingController();
  final TextEditingController widthController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController squrefitController = TextEditingController();
  final TextEditingController dimensionController = TextEditingController();
  final TextEditingController specialremarkController = TextEditingController();
  final TextEditingController signage_detailsController =
      TextEditingController();
  final TextEditingController client_idController = TextEditingController();
  HomeController controller = Get.find<HomeController>();

  // File? photo;
  // File? image;

  final _formKey = GlobalKey<FormState>();

  //String selectedDimension = 'Feet';
  bool isSubmit = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widthController.addListener(calculateSquareFeet);
    heightController.addListener(calculateSquareFeet);
    quantityController.addListener(calculateSquareFeet);
    controller.getreceesignageDetails();

    setDefault();
    _themeMode();
  }

  setDefault() async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      //  controller.getreceedetailsData!=null;
      print('');
      //  controller.getreceedetailsData!.receeVerifications!.clear();
      await controller.getReceesubjobDetails(id: widget.id);

      //
      // if (widget.flag == true) {
      //   await controller.getReceesubjobDetails(id: widget.id);
      // } else {
      //   await controller.getReceedetails(id: widget.id);
      // }
      if (controller.getreceedetailsData != null) {
        // Fetch the data if it's not available
        await controller.getReceesubjobDetails(id: widget.id);
      }

      if (controller.getreceedetailsData != null &&
          controller.getreceedetailsData!.receeVerifications!.isNotEmpty) {
        // Access properties only if controller.getreceedetailsData is not null
        // and receeVerifications is not empty
        job_cardContoller.text =
            controller.getreceedetailsData!.shopcode.toString();

        widthController.text = controller
            .getreceedetailsData!.receeVerifications!.last.withColumn!;

        heightController.text = controller
            .getreceedetailsData!.receeVerifications!.last.heightColumn!;

        squrefitController.text =
            controller.getreceedetailsData!.receeVerifications!.last.squareFit!;

        selectedItem =
            controller.getreceedetailsData!.receeVerifications!.last.dimension;

        specialremarkController.text = controller
            .getreceedetailsData!.receeVerifications!.last.signageDetails!;

        signageItems = controller
            .getreceedetailsData!.receeVerifications!.last.signageType;

        quantityController.text =
            controller.getreceedetailsData!.receeVerifications!.last.quantity!;
      }
      print('mismatching data::::::::::::::::::>>>>>>>>>>>>>');
      print(specialremarkController.text);
      //  controller.setImagePathEmpty();
      controller.setImagesEmpty();
    });
  }

  dynamic signageItems;
  List<SignageData> thelist = [];

  String? selectedItem;

  double toFeet(double value) {
    switch (selectedItem) {
      case 'Inch':
        return value / 12;
      case 'mm':
        return value / 304.8;
      case 'Feet':
      default:
        return value;
    }
  }

  void calculateSquareFeet() {
    double width = double.tryParse(widthController.text) ?? 0;
    double height = double.tryParse(heightController.text) ?? 0;
    double quantity = double.tryParse(quantityController.text) ?? 0;
    double widthInFeet = toFeet(width);
    double heightInFeet = toFeet(height);
    // double quantityfeet = toFeet(quantity);
    double squareFeet = widthInFeet * heightInFeet * quantity;
    toFeet(squareFeet);
    squrefitController.text = squareFeet.toString();
    print("RESULT ===>${squareFeet.toString()}");
  }

  @override
  void dispose() {
    widthController.dispose();
    heightController.dispose();
    quantityController.dispose();
    super.dispose();
  }

  late Color bgColor;
  bool isThemeDark = true;

  late ShimmerProLight shimmerlight;
  void _themeMode() {
    isThemeDark = !isThemeDark;
    if (isThemeDark) {
      setState(() {
        bgColor = const Color.fromARGB(255, 50, 50, 50);
        shimmerlight = ShimmerProLight.lighter;
      });
    } else {
      setState(() {
        bgColor = const Color.fromARGB(255, 240, 240, 240);
        shimmerlight = ShimmerProLight.darker;
      });
    }
  }

  ImagePicker imagePicker = ImagePicker();

  Future<void> _pickAndCropImage(ImageSource source) async {
    final XFile? image = await imagePicker.pickImage(source: source);
    if (image != null) {
      final Uint8List? croppedImage = await _cropImage(image);
      if (croppedImage != null) {
        setState(() {
          controller.pickedEditedImagePathList.add(croppedImage);
        });
      }
    }
  }

  Future<Uint8List?> _cropImage(XFile image) async {
    final CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: image.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Cropper',
          toolbarColor: Colors.deepOrange,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
        IOSUiSettings(
          title: 'Cropper',
        ),
      ],
    );

    if (croppedFile != null) {
      return await croppedFile.readAsBytes();
    }
    return null;
  }

  Future<void> _pickImageFromGalleryAndCamera() async {
    final XFile? image =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      final Uint8List imageBytes = await image.readAsBytes();
      setState(() {
        controller.pickedEditedImagePathList.add(imageBytes);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //  var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Recce Report Details",
            style: primaryFonts.copyWith(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: AppColors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: SingleChildScrollView(
          child: GetBuilder<HomeController>(builder: (_) {
            return controller.isLoadingdatails.isTrue
                ? Column(
                    children: [
                      ShimmerPro.text(
                        light: shimmerlight,
                        scaffoldBackgroundColor: bgColor,
                        width: 450,
                      ),
                      ksizedbox10,
                      ShimmerPro.sized(
                        light: shimmerlight,
                        scaffoldBackgroundColor: bgColor,
                        width: 450,
                        height: 50,
                      ),
                      ksizedbox10,
                      ShimmerPro.text(
                        light: shimmerlight,
                        scaffoldBackgroundColor: bgColor,
                        width: 450,
                      ),
                      ksizedbox10,
                      ShimmerPro.sized(
                        light: shimmerlight,
                        scaffoldBackgroundColor: bgColor,
                        width: 450,
                        height: 50,
                      ),
                      ksizedbox10,
                      ShimmerPro.text(
                        light: shimmerlight,
                        scaffoldBackgroundColor: bgColor,
                        width: 450,
                      ),
                      ksizedbox10,
                      ShimmerPro.sized(
                        light: shimmerlight,
                        scaffoldBackgroundColor: bgColor,
                        width: 450,
                        height: 50,
                      ),
                      ksizedbox10,
                    ],
                  )
                : Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Project Details",
                          style: primaryFonts.copyWith(
                              color: AppColors.red,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        ksizedbox15,
                        Container(
                          height: 45,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4)),
                          child: TextFormField(
                            // controller: job_cardContoller,
                            //obscureText: false,
                            //       autofocus: true,
                            readOnly: true,
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.only(top: 5, left: 10),
                                hintText:
                                    controller.getreceedetailsData?.dealerName,
                                hintStyle: primaryFonts.copyWith(
                                    color: AppColors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                                border: InputBorder.none,
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: BorderSide(
                                        width: 1, color: AppColors.black)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: BorderSide(
                                        width: 1, color: AppColors.black))),
                          ),
                        ),
                        ksizedbox15,
                        Container(
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: TextFormField(
                            // controller: job_cardContoller,
                            focusNode: _focusNode, // Assign the FocusNode
                            //  autofocus: false, // Disable autofocus
                            readOnly:
                                true, // Readonly will ensure the text field doesn't lose focus

                            onTap: () =>
                                _focusNode.requestFocus(), // Focus when tapped
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: 5, left: 10),
                              hintText: controller.getreceedetailsData?.city,
                              hintStyle: primaryFonts.copyWith(
                                color: AppColors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                              //   labelText: 'fds',
                              border: InputBorder.none,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: BorderSide(
                                    width: 1, color: AppColors.black),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: BorderSide(
                                    width: 1, color: AppColors.black),
                              ),
                            ),
                          ),
                        ),
                        ksizedbox15,
                        Container(
                          height: 45,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4)),
                          child: TextFormField(
                            // controller: job_cardContoller,
                            autofocus: false,
                            readOnly: true,
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.only(top: 5, left: 10),
                                hintText:
                                    controller.getreceedetailsData?.address,
                                hintStyle: primaryFonts.copyWith(
                                    color: AppColors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                                border: InputBorder.none,
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: BorderSide(
                                        width: 1, color: AppColors.black)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: BorderSide(
                                        width: 1, color: AppColors.black))),
                          ),
                        ),
                        ksizedbox20,
                        Text(
                          "Signage Details",
                          style: primaryFonts.copyWith(
                              color: AppColors.red,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        ksizedbox20,
                        Container(
                          height: 45,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4)),
                          child: TextFormField(
                            // controller: job_cardContoller,
                            autofocus: true,
                            readOnly: true,
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.only(top: 5, left: 10),
                                hintText: controller.getreceedetailsData?.city,
                                hintStyle: primaryFonts.copyWith(
                                    color: AppColors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                                //   labelText: "ID",
                                labelStyle: primaryFonts.copyWith(
                                    color: AppColors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                                border: InputBorder.none,
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: BorderSide(
                                        width: 1, color: AppColors.black)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: BorderSide(
                                        width: 1, color: AppColors.black))),
                          ),
                        ),
                        ksizedbox15,
                        // Container(
                        //   height: 45,
                        //   decoration:
                        //       BoxDecoration(borderRadius: BorderRadius.circular(4)),
                        //   child: TextFormField(
                        //     decoration: InputDecoration(
                        //         contentPadding: EdgeInsets.only(top: 5, left: 10),
                        //         hintText: "Redmi Shop",
                        //         hintStyle: primaryFonts.copyWith(
                        //             color: AppColors.black.withOpacity(.20),
                        //             fontSize: 13,
                        //             fontWeight: FontWeight.w600),
                        //         labelText: "Store Name",
                        //         labelStyle: primaryFonts.copyWith(
                        //             color: AppColors.black,
                        //             fontSize: 14,
                        //             fontWeight: FontWeight.w600),
                        //         border: InputBorder.none,
                        //         enabledBorder: OutlineInputBorder(
                        //             borderRadius: BorderRadius.circular(4),
                        //             borderSide:
                        //                 BorderSide(width: 1, color: AppColors.black)),
                        //         focusedBorder: OutlineInputBorder(
                        //             borderRadius: BorderRadius.circular(4),
                        //             borderSide:
                        //                 BorderSide(width: 1, color: AppColors.black))),
                        //   ),
                        // ),
                        // ksizedbox15,
                        // Container(
                        //   height: 45,
                        //   decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(4)),
                        //   child: TextFormField(
                        //     decoration: InputDecoration(
                        //         contentPadding: EdgeInsets.only(top: 5, left: 10),
                        //         hintText: "Redmi Shop",
                        //         hintStyle: primaryFonts.copyWith(
                        //             color: AppColors.black.withOpacity(.20),
                        //             fontSize: 13,
                        //             fontWeight: FontWeight.w600),
                        //         labelText: "City",
                        //         labelStyle: primaryFonts.copyWith(
                        //             color: AppColors.black,
                        //             fontSize: 14,
                        //             fontWeight: FontWeight.w600),
                        //         border: InputBorder.none,
                        //         enabledBorder: OutlineInputBorder(
                        //             borderRadius: BorderRadius.circular(4),
                        //             borderSide: BorderSide(
                        //                 width: 1, color: AppColors.black)),
                        //         focusedBorder: OutlineInputBorder(
                        //             borderRadius: BorderRadius.circular(4),
                        //             borderSide: BorderSide(
                        //                 width: 1, color: AppColors.black))),
                        //   ),
                        // ),
                        // ksizedbox15,
                        // Container(
                        //   height: 45,
                        //   decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(4)),
                        //   child: TextFormField(
                        //     decoration: InputDecoration(
                        //         contentPadding: EdgeInsets.only(top: 5, left: 10),
                        //         hintText: "Perambur",
                        //         hintStyle: primaryFonts.copyWith(
                        //             color: AppColors.black.withOpacity(.20),
                        //             fontSize: 13,
                        //             fontWeight: FontWeight.w600),
                        //         labelText: "Area Name",
                        //         labelStyle: primaryFonts.copyWith(
                        //             color: AppColors.black,
                        //             fontSize: 14,
                        //             fontWeight: FontWeight.w600),
                        //         border: InputBorder.none,
                        //         enabledBorder: OutlineInputBorder(
                        //             borderRadius: BorderRadius.circular(4),
                        //             borderSide: BorderSide(
                        //                 width: 1, color: AppColors.black)),
                        //         focusedBorder: OutlineInputBorder(
                        //             borderRadius: BorderRadius.circular(4),
                        //             borderSide: BorderSide(
                        //                 width: 1, color: AppColors.black))),
                        //   ),
                        // ),
                        ksizedbox15,
                        Container(
                          height: 45,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4)),
                          child: TextFormField(
                            readOnly: true,
                            controller: job_cardContoller,
                            //   keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.only(top: 5, left: 10),
                                hintText: controller.getreceedetailsData == null
                                    ? 'no data'
                                    : controller.getreceedetailsData?.shopcode,
                                hintStyle: primaryFonts.copyWith(
                                    color: AppColors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                                //  labelText: 'Job Card',
                                labelStyle: primaryFonts.copyWith(
                                    color: AppColors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                                border: InputBorder.none,
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: BorderSide(
                                        width: 1, color: AppColors.black)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: BorderSide(
                                        width: 1, color: AppColors.black))),
                          ),
                        ),
                        ksizedbox15,
                        Container(
                          height: 45,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4)),
                          child: TextFormField(
                            readOnly: true,
                            keyboardType: TextInputType.number,
                            controller: client_idController,
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.only(top: 5, left: 10),
                                hintText:
                                    controller.getreceedetailsData?.recceId,
                                hintStyle: primaryFonts.copyWith(
                                    color: AppColors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                                labelStyle: primaryFonts.copyWith(
                                    color: AppColors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                                border: InputBorder.none,
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: BorderSide(
                                        width: 1, color: AppColors.black)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: BorderSide(
                                        width: 1, color: AppColors.black))),
                          ),
                        ),
                        ksizedbox15,
                        //  controller.getreceedetailsData!.receeVerifications.isEmpty?Container():
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 0),
                              child: Container(
                                margin: EdgeInsets.only(right: 0),
                                height: 55.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: DropdownButtonFormField<String>(
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  value: signageItems,
                                  onChanged: (newValue) {
                                    setState(() {
                                      signageItems = newValue!;
                                      // calculateSquareFeet();
                                    });
                                  },
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Please select a Signage Type';
                                    }
                                    return null; // Return null if the input is valid
                                  },
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.only(top: 5, left: 10),
                                    labelText: 'Signage Type',
                                    labelStyle: primaryFonts.copyWith(
                                      color: AppColors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: BorderSide(
                                        width: 1,
                                        color: AppColors.black,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: BorderSide(
                                        width: 1,
                                        color: AppColors.black,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: BorderSide(
                                        width: 1,
                                        color: AppColors.black,
                                      ),
                                    ),
                                  ),
                                  items: controller
                                      .getreceesignagedetailsData // Replace with your dropdown options
                                      .map<DropdownMenuItem<String>>((value) {
                                    return DropdownMenuItem<String>(
                                      value: value.signageName,
                                      child: Text(value.signageName.toString()),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                            // Container(
                            //   height: 55.h,
                            //   decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.circular(4)),
                            //   child: TextFormField(
                            //     autovalidateMode:
                            //         AutovalidateMode.onUserInteraction,
                            //     //  keyboardType: TextInputType.number,
                            //     controller: signage_detailsController,
                            //     validator: (value) {
                            //       if (value == null || value.isEmpty) {
                            //         return 'Please enter Signage Details';
                            //       }
                            //       // You can add more validation rules here if needed
                            //       return null; // Return null if the input is valid
                            //     },
                            //     decoration: InputDecoration(
                            //         contentPadding:
                            //             EdgeInsets.only(top: 5, left: 10),
                            //         hintText:   "HFE42USD94645",
                            //         hintStyle: primaryFonts.copyWith(
                            //             color: AppColors.black.withOpacity(.20),
                            //             fontSize: 13,
                            //             fontWeight: FontWeight.w600),
                            //         labelText: 'Signage Details',
                            //         labelStyle: primaryFonts.copyWith(
                            //             color: AppColors.black,
                            //             fontSize: 14,
                            //             fontWeight: FontWeight.w600),
                            //         border: OutlineInputBorder(
                            //           borderRadius: BorderRadius.circular(4),
                            //           borderSide: BorderSide(
                            //             width: 1,
                            //             color: AppColors.black,
                            //           ),
                            //         ),
                            //         enabledBorder: OutlineInputBorder(
                            //             borderRadius: BorderRadius.circular(4),
                            //             borderSide: BorderSide(
                            //                 width: 1, color: AppColors.black)),
                            //         focusedBorder: OutlineInputBorder(
                            //             borderRadius: BorderRadius.circular(4),
                            //             borderSide: BorderSide(
                            //                 width: 1, color: AppColors.black))),
                            //   ),
                            // ),
                            //    ksizedbox10,
                            Container(
                              height: 55.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4)),
                              child: TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                controller: specialremarkController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter Special Remark';
                                  }
                                  // You can add more validation rules here if needed
                                  return null; // Return null if the input is valid
                                },
                                decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.only(top: 5, left: 10),
                                    hintText: "HOARDINGS",
                                    hintStyle: primaryFonts.copyWith(
                                        color: AppColors.black.withOpacity(.20),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600),
                                    labelText: 'Special Remark',
                                    labelStyle: primaryFonts.copyWith(
                                        color: AppColors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: BorderSide(
                                        width: 1,
                                        color: AppColors.black,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                        borderSide: BorderSide(
                                            width: 1, color: AppColors.black)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                        borderSide: BorderSide(
                                            width: 1, color: AppColors.black))),
                              ),
                            ),
                            ksizedbox5,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(right: 8),
                                    height: 55.h,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4)),
                                    child: TextFormField(
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      keyboardType: TextInputType.number,
                                      controller: widthController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter Width';
                                        }
                                        // You can add more validation rules here if needed
                                        return null; // Return null if the input is valid
                                      },
                                      decoration: InputDecoration(
                                          contentPadding:
                                              EdgeInsets.only(top: 5, left: 10),
                                          labelText: 'Width',
                                          labelStyle: primaryFonts.copyWith(
                                              color: AppColors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            borderSide: BorderSide(
                                              width: 1,
                                              color: AppColors.black,
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              borderSide: BorderSide(
                                                  width: 1,
                                                  color: AppColors.black)),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              borderSide: BorderSide(
                                                  width: 1,
                                                  color: AppColors.black))),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 55.h,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4)),
                                    child: TextFormField(
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      keyboardType: TextInputType.number,
                                      controller: heightController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter Height';
                                        }
                                        // You can add more validation rules here if needed
                                        return null; // Return null if the input is valid
                                      },
                                      decoration: InputDecoration(
                                          contentPadding:
                                              EdgeInsets.only(top: 5, left: 10),
                                          labelText: 'Height',
                                          labelStyle: primaryFonts.copyWith(
                                              color: AppColors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            borderSide: BorderSide(
                                              width: 1,
                                              color: AppColors.black,
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              borderSide: BorderSide(
                                                  width: 1,
                                                  color: AppColors.black)),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              borderSide: BorderSide(
                                                  width: 1,
                                                  color: AppColors.black))),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            ksizedbox5,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 55.h,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4)),
                                    child: TextFormField(
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      keyboardType: TextInputType.number,
                                      controller: quantityController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter quantity';
                                        }
                                        // You can add more validation rules here if needed
                                        return null; // Return null if the input is valid
                                      },
                                      decoration: InputDecoration(
                                          contentPadding:
                                              EdgeInsets.only(top: 5, left: 10),
                                          labelText: 'Quantity',
                                          labelStyle: primaryFonts.copyWith(
                                              color: AppColors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            borderSide: BorderSide(
                                              width: 1,
                                              color: AppColors.black,
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              borderSide: BorderSide(
                                                  width: 1,
                                                  color: AppColors.black)),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              borderSide: BorderSide(
                                                  width: 1,
                                                  color: AppColors.black))),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Container(
                                      margin: EdgeInsets.only(right: 0),
                                      height: 55.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: DropdownButtonFormField<String>(
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        value: selectedItem,
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            selectedItem = newValue!;
                                            calculateSquareFeet();
                                          });
                                        },
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please select a dimension';
                                          }
                                          return null; // Return null if the input is valid
                                        },
                                        decoration: InputDecoration(
                                          contentPadding:
                                              EdgeInsets.only(top: 5, left: 10),
                                          labelText: 'Dimensions',
                                          labelStyle: primaryFonts.copyWith(
                                            color: AppColors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            borderSide: BorderSide(
                                              width: 1,
                                              color: AppColors.black,
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            borderSide: BorderSide(
                                              width: 1,
                                              color: AppColors.black,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            borderSide: BorderSide(
                                              width: 1,
                                              color: AppColors.black,
                                            ),
                                          ),
                                        ),
                                        items: <String>[
                                          'mm',
                                          'Inch',
                                          'Feet'
                                        ] // Replace with your dropdown options
                                            .map<DropdownMenuItem<String>>(
                                                (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        ksizedbox10,
                        Container(
                          height: 55.h,
                          width: 166,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            keyboardType: TextInputType.number,
                            controller: squrefitController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter Square Feet';
                              }
                              // You can add more validation rules here if needed
                              return null; // Return null if the input is valid
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: 5, left: 10),
                              labelText: 'Square Feet',
                              labelStyle: primaryFonts.copyWith(
                                color: AppColors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: AppColors.black,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: AppColors.black,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: AppColors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                        ksizedbox20,
                        Text(
                          "Capture Spaces & My Space",
                          style: primaryFonts.copyWith(
                              color: AppColors.red,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                        ksizedbox15,

                        controller.getreceedetailsData?.isReceeVerrified == "1"
                            ? controller.getreceedetailsData!
                                    .receeVerifications!.isEmpty
                                ? Container()
                                : Container(
                                    height: 200,
                                    child: ListView.builder(
                                        itemCount: controller
                                            .getreceedetailsData!
                                            .receeVerifications! //.last.beforeImages!
                                            .last
                                            .beforeImages!
                                            .length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index2) {
                                          return Card(
                                            child: InkWell(
                                              onTap: () {
                                                showImageViewer(
                                                    context,
                                                    Image.network(controller
                                                            .getreceedetailsData!
                                                            .receeVerifications!
                                                            .last
                                                            .beforeImages![index2])
                                                        .image,
                                                    swipeDismissible: true,
                                                    doubleTapZoomable: true);
                                              },
                                              child: Container(
                                                width: 200,
                                                child: Image.network(controller
                                                    .getreceedetailsData!
                                                    .receeVerifications!
                                                    .last
                                                    .beforeImages![index2]),
                                              ),
                                            ),
                                          );
                                        }),
                                  )
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                          onTap: () async {
                                            _pickAndCropImage(
                                                ImageSource.camera);
                                            controller.update();
                                            //  controller.addImageCamera(photo);
                                          },
                                          child: Column(
                                            children: [
                                              Container(
                                                height: 115.h,
                                                decoration: BoxDecoration(
                                                    color: AppColors.lightGrey
                                                        .withOpacity(.20),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6)),
                                                child: Image.asset(
                                                  "assets/images/camera.png",
                                                  height: 165,
                                                  width: 185,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                "Camera",
                                                style: primaryFonts.copyWith(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          )),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                          onTap: () async {
                                            _pickAndCropImage(
                                                ImageSource.gallery);

                                            controller.update();
                                          },
                                          child:
                                              //Obx(
                                              //() => controller.pickedImagePath == ""
                                              //?
                                              Column(
                                            children: [
                                              Container(
                                                height: 120.h,
                                                decoration: BoxDecoration(
                                                    color: AppColors.lightGrey
                                                        .withOpacity(.20),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6)),
                                                child: Image.asset(
                                                  "assets/images/gallery.png",
                                                  height: 165,
                                                  width: 185,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                "Gallery",
                                                style: primaryFonts.copyWith(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          )
                                          // : Container(
                                          //     height: 120.h,
                                          //     decoration: BoxDecoration(
                                          //         // image: DecorationImage(
                                          //         //     image: FileImage(File(
                                          //         //   controller.pickedImagePath!,
                                          //         // )
                                          //         // )),
                                          //         color: AppColors.lightGrey
                                          //             .withOpacity(.20),
                                          //         borderRadius:
                                          //             BorderRadius.circular(6)),
                                          //     child: Image.asset(
                                          //       "assets/images/gallery.png",
                                          //       height: 165,
                                          //       width: 185,
                                          //     ),
                                          //   ),
                                          //  ),
                                          ),
                                    ),
                                  )
                                ],
                              ),
                        ksizedbox10,

                        if (controller.pickedEditedImagePathList.isNotEmpty)
                          Container(
                            height: 150,
                            width: 500,
                           // color: Colors.amber,
                            child: ListView.builder(
                              itemCount:
                                  controller.pickedEditedImagePathList.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                // final imageBytes = controller
                                //     .pickedEditedImagePathList[index];
                                return Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        onTap: () {
                                          showImageViewer(
                                              context,
                                              Image.memory(controller
                                                          .pickedEditedImagePathList[
                                                      index]!)
                                                  .image);
                                        },
                                        child: Container(
                                          height: 150,
                                          child: Image.memory(
                                            controller
                                                    .pickedEditedImagePathList[
                                                index]!,
                                            fit: BoxFit.fitHeight,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 0,
                                      right: 0,
                                      child: CircleAvatar(
                                        child: IconButton(
                                          icon: const Icon(
                                            Icons.delete,
                                            color: AppColors.red,
                                          ),
                                          onPressed: () {
                                            // Add your delete logic here
                                            // For example, you can remove the image path from the list
                                            setState(
                                              () {
                                                controller
                                                    .pickedEditedImagePathList
                                                    .removeAt(index);
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ksizedbox20,
                        controller.getreceedetailsData?.isReceeVerrified == "1"
                            ? InkWell(
                                onTap: () {
                                  Get.to(BottomNaviBar());
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 45,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: AppColors.green,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Text(
                                    "Completed",
                                    style: primaryFonts.copyWith(
                                        color: AppColors.white,
                                        fontSize: 23,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              )
                            : InkWell(
                                onTap: () {
                                  if (isSubmit == true) {
                                    isSubmit = false;
                                    if (_formKey.currentState!.validate()) {
                                      print('----------------image>>>>>>>>>>>');
                                      print(
                                          controller.pickedEditedImagePathList);
                                      print(specialremarkController.text);
                                      print(heightController.text);
                                      print(squrefitController.text);
                                      print(selectedItem);
                                      print(widthController.text);
                                      print(signageItems);

                                      // Validate media (picked images)
                                      if (specialremarkController
                                              .text.isNotEmpty &&
                                          heightController.text.isNotEmpty &&
                                          squrefitController.text.isNotEmpty &&
                                          selectedItem != null &&
                                          signageItems != null &&
                                          widthController.text.isNotEmpty &&
                                          controller.pickedEditedImagePathList
                                              .isNotEmpty) {
                                        // widget.flag == true
                                        //     ?
                                        controller.verifysubjobRecee(
                                          jobcard:
                                              controller.getreceedetailsData !=
                                                      null
                                                  ? controller
                                                      .getreceedetailsData!
                                                      .shopcode
                                                      .toString()
                                                  : '',
                                          quantity:
                                              controller.getreceedetailsData !=
                                                      null
                                                  ? quantityController.text
                                                  : '',
                                          width: controller
                                                      .getreceedetailsData !=
                                                  null
                                              ? widthController.text.toString()
                                              : '',
                                          height:
                                              controller.getreceedetailsData !=
                                                      null
                                                  ? heightController.text
                                                  : '',
                                          squrefit:
                                              controller.getreceedetailsData !=
                                                      null
                                                  ? squrefitController.text
                                                  : '',
                                          dimension:
                                              controller.getreceedetailsData !=
                                                      null
                                                  ? selectedItem
                                                  : '',
                                          signage_type:
                                              controller.getreceedetailsData !=
                                                      null
                                                  ? specialremarkController.text
                                                  : '',
                                          signage_details: controller
                                                  .getreceesignagedetailsData
                                                  .isNotEmpty
                                              ? signageItems
                                              : '',
                                          client_id:
                                              controller.getreceedetailsData !=
                                                      null
                                                  ? controller
                                                      .getreceedetailsData!.id
                                                      .toString()
                                                  : '',
                                          media: controller
                                              .pickedEditedImagePathList,
                                        );
                                      } else {
                                        isSubmit = true;
                                        Get.rawSnackbar(
                                            backgroundColor: AppColors.red,
                                            title: 'Fill All Details',
                                            messageText: Text(
                                              "Please fill all the details before continue.",
                                              style: TextStyle(
                                                  color: AppColors.white),
                                            ));
                                      }
                                    }
                                  }
                                },
                                child: Obx(
                                  () => Container(
                                    alignment: Alignment.center,
                                    height: 45,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: AppColors.green,
                                        borderRadius: BorderRadius.circular(8)),
                                    child: controller
                                            .isLoadingverification.value
                                        ? Container(
                                            height: 45,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                                color: AppColors.green,
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            child: const Center(
                                              child: CircularProgressIndicator(
                                                color: AppColors.white,
                                              ),
                                            ),
                                          )
                                        : Text(
                                            "Submit",
                                            style: primaryFonts.copyWith(
                                                color: AppColors.white,
                                                fontSize: 23,
                                                fontWeight: FontWeight.w600),
                                          ),
                                  ),
                                ),
                              ),
                        ksizedbox20,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.to(BottomNaviBar(
                                  index: 1,
                                ));
                              },
                              child: Text(
                                "Cancel",
                                style: primaryFonts.copyWith(
                                    color: AppColors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ],
                        ),
                        ksizedbox20
                      ],
                    ),
                  );
          }),
        ),
      ),
    );
  }
}
