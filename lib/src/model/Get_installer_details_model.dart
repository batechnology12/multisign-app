// To parse this JSON data, do
//
//     final getIInstallerDetailsModel = getIInstallerDetailsModelFromJson(jsonString);

import 'dart:convert';

GetIInstallerDetailsModel getIInstallerDetailsModelFromJson(String str) => GetIInstallerDetailsModel.fromJson(json.decode(str));

String getIInstallerDetailsModelToJson(GetIInstallerDetailsModel data) => json.encode(data.toJson());

class GetIInstallerDetailsModel {
    bool? status;
    InstallerData? data;

    GetIInstallerDetailsModel({
        this.status,
        this.data,
    });

    factory GetIInstallerDetailsModel.fromJson(Map<String, dynamic> json) => GetIInstallerDetailsModel(
        status: json["status"],
        data: json["data"] == null ? null : InstallerData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
    };
}

class InstallerData {
    int? id;
    dynamic importId;
    String? clientId;
    String? shopcode;
    String? shopName;
    String? address;
    String? city;
    String? gstNumber;
    String? recceId;
    String? installerId;
    String? installerStatus;
    String? status;
    String? isReceeVerrified;
    String? region;
    String? areaName;
    String? dealerName;
    String? contact;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? isDeleted;
    dynamic deletedAt;
    List<ReceeVerification>? receeVerifications;

    InstallerData({
        this.id,
        this.importId,
        this.clientId,
        this.shopcode,
        this.shopName,
        this.address,
        this.city,
        this.gstNumber,
        this.recceId,
        this.installerId,
        this.installerStatus,
        this.status,
        this.isReceeVerrified,
        this.region,
        this.areaName,
        this.dealerName,
        this.contact,
        this.createdAt,
        this.updatedAt,
        this.isDeleted,
        this.deletedAt,
        this.receeVerifications,
    });

    factory InstallerData.fromJson(Map<String, dynamic> json) => InstallerData(
        id: json["id"],
        importId: json["import_id"],
        clientId: json["client_id"],
        shopcode: json["shopcode"],
        shopName: json["shop_name"],
        address: json["address"],
        city: json["city"],
        gstNumber: json["gst_number"],
        recceId: json["recce_id"],
        installerId: json["installer_id"],
        installerStatus: json["installer_status"],
        status: json["status"],
        isReceeVerrified: json["is_recee_verrified"],
        region: json["region"],
        areaName: json["area_name"],
        dealerName: json["dealer_name"],
        contact: json["contact"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        isDeleted: json["is_deleted"],
        deletedAt: json["deleted_at"],
        receeVerifications: json["recee_verifications"] == null ? [] : List<ReceeVerification>.from(json["recee_verifications"]!.map((x) => ReceeVerification.fromJson(x))),
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
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "is_deleted": isDeleted,
        "deleted_at": deletedAt,
        "recee_verifications": receeVerifications == null ? [] : List<dynamic>.from(receeVerifications!.map((x) => x.toJson())),
    };
}

class ReceeVerification {
    int? id;
    String? userId;
    String? clientId;
    String? installerId;
    String? jobCard;
    String? withColumn;
    String? heightColumn;
    String? squareFit;
    String? dimension;
    dynamic quantity;
    String? signageType;
    String? signageDetails;
    List<String>? beforeImages;
    dynamic afterImages;
    String? isReceeVerrified;
    String? isJobCompleted;
    String? isPrinting;
    DateTime? createdAt;
    DateTime? updatedAt;

    ReceeVerification({
        this.id,
        this.userId,
        this.clientId,
        this.installerId,
        this.jobCard,
        this.withColumn,
        this.heightColumn,
        this.squareFit,
        this.dimension,
        this.signageType,
        this.signageDetails,
        this.beforeImages,
        this.afterImages,
        this.isReceeVerrified,
        this.isJobCompleted,
        this.isPrinting,
        this.createdAt,
        this.updatedAt,
        this.quantity,
    });

    factory ReceeVerification.fromJson(Map<String, dynamic> json) => ReceeVerification(
        id: json["id"],
        userId: json["user_id"],
        clientId: json["client_id"],
        installerId: json["installer_id"],
        jobCard: json["job_card"],
        quantity: json["qty"],
        withColumn: json["with_column"],
        heightColumn: json["height_column"],
        squareFit: json["square_fit"],
        dimension: json["dimension"],
        signageType: json["signage_type"],
        signageDetails: json["signage_details"],
        beforeImages: json["before_images"] == null ? [] : List<String>.from(json["before_images"]!.map((x) => x)),
        afterImages: json["after_images"],
        isReceeVerrified: json["is_recee_verrified"],
        isJobCompleted: json["is_job_completed"],
        isPrinting: json["isPrinting"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
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
        "qty":quantity,
        "dimension": dimension,
        "signage_type": signageType,
        "signage_details": signageDetails,
        "before_images": beforeImages == null ? [] : List<dynamic>.from(beforeImages!.map((x) => x)),
        "after_images": afterImages,
        "is_recee_verrified": isReceeVerrified,
        "is_job_completed": isJobCompleted,
        "isPrinting": isPrinting,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
