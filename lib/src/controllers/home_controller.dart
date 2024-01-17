import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multisign_app/src/const/app_colors.dart';
import 'package:multisign_app/src/model/home_model.dart';

class Multisign extends GetxController {
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



  // addImages(photos) {
  //  cameraImages.
  //   update();
  // }
}
