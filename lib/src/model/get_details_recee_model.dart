// To parse this JSON data, do
//
//     final getIReceeDetailsModel = getIReceeDetailsModelFromJson(jsonString);

import 'dart:convert';

GetIReceeDetailsModel getIReceeDetailsModelFromJson(String str) => GetIReceeDetailsModel.fromJson(json.decode(str));

String getIReceeDetailsModelToJson(GetIReceeDetailsModel data) => json.encode(data.toJson());

class GetIReceeDetailsModel {
    bool status;
    Data data;

    GetIReceeDetailsModel({
        required this.status,
        required this.data,
    });

    factory GetIReceeDetailsModel.fromJson(Map<String, dynamic> json) => GetIReceeDetailsModel(
        status: json["status"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
    };
}

class Data {
    int id;
    String jobcard;
    String clientName;
    String scopeOfWork;
    String address;
    String city;
    String state;
    String gstNumber;
    String estimateNumber;
    String poNumber;
    DateTime poDate;
    DateTime targetCompletionDate;
    String particular;
    String qty;
    String rate;
    String value;
    String marketterId;
    String recceId;
    String production;
    String designing;
    String data;
    dynamic installerId;
    String installerStatus;
    String status;
    String isReceeVerrified;
    DateTime createdAt;
    DateTime updatedAt;
    String isDeleted;
    dynamic deletedAt;
    List<ReceeVerification> receeVerifications;

    Data({
        required this.id,
        required this.jobcard,
        required this.clientName,
        required this.scopeOfWork,
        required this.address,
        required this.city,
        required this.state,
        required this.gstNumber,
        required this.estimateNumber,
        required this.poNumber,
        required this.poDate,
        required this.targetCompletionDate,
        required this.particular,
        required this.qty,
        required this.rate,
        required this.value,
        required this.marketterId,
        required this.recceId,
        required this.production,
        required this.designing,
        required this.data,
        required this.installerId,
        required this.installerStatus,
        required this.status,
        required this.isReceeVerrified,
        required this.createdAt,
        required this.updatedAt,
        required this.isDeleted,
        required this.deletedAt,
        required this.receeVerifications,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"]??"",
        jobcard: json["jobcard"]??"",
        clientName: json["client_name"]??"",
        scopeOfWork: json["scope_of_work"]??"",
        address: json["address"]??"",
        city: json["city"]??"",
        state: json["state"]??"",
        gstNumber: json["gst_number"]??"",
        estimateNumber: json["estimate_number"]??"",
        poNumber: json["po_number"]??"",
        poDate:json["po_date"] ==  null ? DateTime.now() : DateTime.parse(json["po_date"]),
        targetCompletionDate:json["target_completion_date"] ==  null ? DateTime.now() :  DateTime.parse(json["target_completion_date"]),
        particular: json["particular"]??"",
        qty: json["qty"]??"",
        rate: json["rate"]??"",
        value: json["value"]??"",
        marketterId: json["marketter_id"]??"",
        recceId: json["recce_id"]??"",
        production: json["production"]??"",
        designing: json["designing"]??"",
        data: json["data"]??"",
        installerId: json["installer_id"]??"",
        installerStatus: json["installer_status"]??"",
        status: json["status"]??"",
        isReceeVerrified: json["is_recee_verrified"]??"",
        createdAt: json["created_at"] == null ? DateTime.now() : DateTime.parse(json["created_at"]),
        updatedAt:json["updated_at"] == null ?  DateTime.now() :  DateTime.parse(json["updated_at"]),
        isDeleted: json["is_deleted"]??"",
        deletedAt: json["deleted_at"]??"",
        receeVerifications: List<ReceeVerification>.from(json["recee_verifications"].map((x) => ReceeVerification.fromJson(x))??""),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "jobcard": jobcard,
        "client_name": clientName,
        "scope_of_work": scopeOfWork,
        "address": address,
        "city": city,
        "state": state,
        "gst_number": gstNumber,
        "estimate_number": estimateNumber,
        "po_number": poNumber,
        "po_date": "${poDate.year.toString().padLeft(4, '0')}-${poDate.month.toString().padLeft(2, '0')}-${poDate.day.toString().padLeft(2, '0')}",
        "target_completion_date": "${targetCompletionDate.year.toString().padLeft(4, '0')}-${targetCompletionDate.month.toString().padLeft(2, '0')}-${targetCompletionDate.day.toString().padLeft(2, '0')}",
        "particular": particular,
        "qty": qty,
        "rate": rate,
        "value": value,
        "marketter_id": marketterId,
        "recce_id": recceId,
        "production": production,
        "designing": designing,
        "data": data,
        "installer_id": installerId,
        "installer_status": installerStatus,
        "status": status,
        "is_recee_verrified": isReceeVerrified,
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
    dynamic installerId;
    String jobCard;
    String withColumn;
    String heightColumn;
    String squareFit;
    String dimension;
    String signageType;
    String signageDetails;
    dynamic beforeImages;
    dynamic afterImages;
    String isReceeVerrified;
    String isJobCompleted;
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
        required this.createdAt,
        required this.updatedAt,
    });

    factory ReceeVerification.fromJson(Map<String, dynamic> json) => ReceeVerification(
        id: json["id"],
        userId: json["user_id"] ?? "",
        clientId: json["client_id"] ?? "",
        installerId: json["installer_id"],
        jobCard: json["job_card"] ?? "",
        withColumn: json["with_column"] ?? "",
        heightColumn: json["height_column"] ?? "",
        squareFit: json["square_fit"] ?? "",
        dimension: json["dimension"] ?? "",
        signageType: json["signage_type"] ?? "",
        signageDetails: json["signage_details"] ?? "",
        beforeImages: json["before_images"],
        afterImages: json["after_images"],
        isReceeVerrified: json["is_recee_verrified"],
        isJobCompleted: json["is_job_completed"],
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
        "before_images": beforeImages,
        "after_images": afterImages,
        "is_recee_verrified": isReceeVerrified,
        "is_job_completed": isJobCompleted,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
