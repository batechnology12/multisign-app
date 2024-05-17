// To parse this JSON data, do
//
//     final getRecceSignageDetails = getRecceSignageDetailsFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/src/material/dropdown.dart';

GetRecceSignageDetails getRecceSignageDetailsFromJson(String str) => GetRecceSignageDetails.fromJson(json.decode(str));

String getRecceSignageDetailsToJson(GetRecceSignageDetails data) => json.encode(data.toJson());

class GetRecceSignageDetails {
    bool? status;
    List<SignageData>? data;

    GetRecceSignageDetails({
        this.status,
        this.data,
    });

    factory GetRecceSignageDetails.fromJson(Map<String, dynamic> json) => GetRecceSignageDetails(
        status: json["status"],
        data: json["data"] == null ? [] : List<SignageData>.from(json["data"]!.map((x) => SignageData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };

  static map(DropdownMenuItem<String> Function(String value) param0) {}
}

class SignageData {
    int? id;
    String? signageName;
    String? signageNo;
    String? status;
    DateTime? createdAt;
    String? createdBy;
    DateTime? updatedAt;
    dynamic updatedBy;
    String? isDeleted;
    dynamic deletedBy;
    dynamic deletedAt;

    SignageData( {
        this.id,
        this.signageName,
        this.signageNo,
        this.status,
        this.createdAt,
        this.createdBy,
        this.updatedAt,
        this.updatedBy,
        this.isDeleted,
        this.deletedBy,
        this.deletedAt,
    });

    factory SignageData.fromJson(Map<String, dynamic> json) => SignageData(
        id: json["id"],
        signageName: json["signageName"],
        signageNo: json["signageNo"],
        status: json["status"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        createdBy: json["created_by"],
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        updatedBy: json["updated_by"],
        isDeleted: json["isDeleted"],
        deletedBy: json["deleted_by"],
        deletedAt: json["deleted_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "signageName": signageName,
        "signageNo": signageNo,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "created_by": createdBy,
        "updated_at": updatedAt?.toIso8601String(),
        "updated_by": updatedBy,
        "isDeleted": isDeleted,
        "deleted_by": deletedBy,
        "deleted_at": deletedAt,
    };
}
