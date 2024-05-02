// To parse this JSON data, do
//
//     final getInstallerSubJobModel = getInstallerSubJobModelFromJson(jsonString);

import 'dart:convert';

GetInstallerSubJobModel getInstallerSubJobModelFromJson(String str) => GetInstallerSubJobModel.fromJson(json.decode(str));

String getInstallerSubJobModelToJson(GetInstallerSubJobModel data) => json.encode(data.toJson());

class GetInstallerSubJobModel {
    bool status;
    List<InstallerSubJobDataList> data;

    GetInstallerSubJobModel({
        required this.status,
        required this.data,
    });

    factory GetInstallerSubJobModel.fromJson(Map<String, dynamic> json) => GetInstallerSubJobModel(
        status: json["status"],
        data: List<InstallerSubJobDataList>.from(json["data"].map((x) => InstallerSubJobDataList.fromJson(x))),

    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class InstallerSubJobDataList {
    int id;
    String importId;
    String clientId;
    String shopcode;
    String shopName;
    String address;
    String city;
    String gstNumber;
    String recceId;
    String installerId;
    String installerStatus;
    String status;
    String isReceeVerrified;
    String region;
    String areaName;
    String dealerName;
    String contact;
    DateTime createdAt;
    DateTime updatedAt;
    String isDeleted;
    dynamic deletedAt;
    List<ReceeVerification> receeVerifications;

    InstallerSubJobDataList({
        required this.id,
        required this.importId,
        required this.clientId,
        required this.shopcode,
        required this.shopName,
        required this.address,
        required this.city,
        required this.gstNumber,
        required this.recceId,
        required this.installerId,
        required this.installerStatus,
        required this.status,
        required this.isReceeVerrified,
        required this.region,
        required this.areaName,
        required this.dealerName,
        required this.contact,
        required this.createdAt,
        required this.updatedAt,
        required this.isDeleted,
        required this.deletedAt,
        required this.receeVerifications,
    });

    factory InstallerSubJobDataList.fromJson(Map<String, dynamic> json) => InstallerSubJobDataList(
        id: json["id"]??0,
        importId: json["import_id"]??'',
        clientId: json["client_id"]??'',
        shopcode: json["shopcode"]??'',
        shopName: json["shop_name"]??'',
        address: json["address"]??'',
        city: json["city"]??'',
        gstNumber: json["gst_number"]??'',
        recceId: json["recce_id"]??'',
        installerId: json["installer_id"]??'',
        installerStatus: json["installer_status"]??'',
        status: json["status"]??'',
        isReceeVerrified: json["is_recee_verrified"]??'',
        region: json["region"]??'',
        areaName: json["area_name"]??'',
        dealerName: json["dealer_name"]??'',
        contact: json["contact"]??'',
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        isDeleted: json["is_deleted"]??'',
        deletedAt: json["deleted_at"]??'',
        receeVerifications: List<ReceeVerification>.from(json["recee_verifications"].map((x) => ReceeVerification.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "import_id": importId,
        "client_id": clientId,
        "shopcode": shopcode,
        "shop_name": shopName,
        "address": address,
        "city": city,
        "gst_number": gstNumber,
        "recce_id": recceId,
        "installer_id": installerId,
        "installer_status": installerStatus,
        "status": status,
        "is_recee_verrified": isReceeVerrified,
        "region": region,
        "area_name": areaName,
        "dealer_name": dealerName,
        "contact": contact,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "is_deleted": isDeleted,
        "deleted_at": deletedAt,
        "recee_verifications": List<dynamic>.from(receeVerifications.map((x) => x.toJson())),
    };
}

class ReceeVerification {
    int id;
    String userId;
    String clientId;
    String? installerId;
    String jobCard;
    String withColumn;
    String heightColumn;
    String squareFit;
    String dimension;
    String signageType;
    String signageDetails;
    List<String> beforeImages;
    List<String>? afterImages;
    String isReceeVerrified;
    String isJobCompleted;
    String isPrinting;
    DateTime createdAt;
    DateTime updatedAt;

    ReceeVerification({
        required this.id,
        required this.userId,
        required this.clientId,
        required this.installerId,
        required this.jobCard,
        required this.withColumn,
        required this.heightColumn,
        required this.squareFit,
        required this.dimension,
        required this.signageType,
        required this.signageDetails,
        required this.beforeImages,
        required this.afterImages,
        required this.isReceeVerrified,
        required this.isJobCompleted,
        required this.isPrinting,
        required this.createdAt,
        required this.updatedAt,
    });

    factory ReceeVerification.fromJson(Map<String, dynamic> json) => ReceeVerification(
        id: json["id"]??0,
        userId: json["user_id"]??'',
        clientId: json["client_id"]??'',
        installerId: json["installer_id"]??'',
        jobCard: json["job_card"]??'',
        withColumn: json["with_column"]??'',
        heightColumn: json["height_column"]??'',
        squareFit: json["square_fit"]??'',
        dimension: json["dimension"]??'',
        signageType: json["signage_type"]??'',
        signageDetails: json["signage_details"]??'',
        beforeImages: List<String>.from(json["before_images"].map((x) => x)),
        afterImages: json["after_images"] == null ? [] : List<String>.from(json["after_images"]!.map((x) => x)),
        isReceeVerrified: json["is_recee_verrified"]??'',
        isJobCompleted: json["is_job_completed"]??'',
        isPrinting: json["isPrinting"]??'',
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "client_id": clientId,
        "installer_id": installerId,
        "job_card": jobCard,
        "with_column": withColumn,
        "height_column": heightColumn,
        "square_fit": squareFit,
        "dimension": dimension,
        "signage_type": signageType,
        "signage_details": signageDetails,
        "before_images": List<dynamic>.from(beforeImages.map((x) => x)),
        "after_images": afterImages == null ? [] : List<dynamic>.from(afterImages!.map((x) => x)),
        "is_recee_verrified": isReceeVerrified,
        "is_job_completed": isJobCompleted,
        "isPrinting": isPrinting,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
