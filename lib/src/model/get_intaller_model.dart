// To parse this JSON data, do
//
//     final getInstallerModel = getInstallerModelFromJson(jsonString);

import 'dart:convert';

GetInstallerModel getInstallerModelFromJson(String str) => GetInstallerModel.fromJson(json.decode(str));

String getInstallerModelToJson(GetInstallerModel data) => json.encode(data.toJson());

class GetInstallerModel {
    bool? status;
    List<intallerListData>? data;

    GetInstallerModel({
        this.status,
        this.data,
    });

    factory GetInstallerModel.fromJson(Map<String, dynamic> json) => GetInstallerModel(
        status: json["status"],
        data: json["data"] == null ? [] : List<intallerListData>.from(json["data"]!.map((x) => intallerListData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class intallerListData {
    int? id;
    dynamic importId;
    String? jobType;
    String? jobCardPrefix;
    String? jobcard;
    String? clientName;
    String? scopeOfWork;
    dynamic address;
    dynamic city;
    dynamic state;
    dynamic gstNumber;
    dynamic estimateNumber;
    dynamic poNumber;
    dynamic poDate;
    DateTime? jcDate;
    DateTime? targetCompletionDate;
    dynamic particular;
    dynamic qty;
    dynamic rate;
    String? value;
    String? marketterId;
    String? prodManagerId;
    String? dataOperatorId;
    String? designerId;
    dynamic recceId;
    dynamic production;
    dynamic designing;
    dynamic data;
    dynamic installerId;
    String? installerStatus;
    String? status;
    String? isReceeVerrified;
    dynamic region;
    String? areaName;
    dynamic dealerName;
    dynamic storeName;
    String? jobStatus;
    dynamic contact;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? isDeleted;
    dynamic deletedAt;
    String? subjobId;
    String? shopName;
    String? shopcode;
    DateTime? subjobDate;
    RecceData? recceData;

    intallerListData({
        this.id,
        this.importId,
        this.jobType,
        this.jobCardPrefix,
        this.jobcard,
        this.clientName,
        this.scopeOfWork,
        this.address,
        this.city,
        this.state,
        this.gstNumber,
        this.estimateNumber,
        this.poNumber,
        this.poDate,
        this.jcDate,
        this.targetCompletionDate,
        this.particular,
        this.qty,
        this.rate,
        this.value,
        this.marketterId,
        this.prodManagerId,
        this.dataOperatorId,
        this.designerId,
        this.recceId,
        this.production,
        this.designing,
        this.data,
        this.installerId,
        this.installerStatus,
        this.status,
        this.isReceeVerrified,
        this.region,
        this.areaName,
        this.dealerName,
        this.storeName,
        this.jobStatus,
        this.contact,
        this.createdAt,
        this.updatedAt,
        this.isDeleted,
        this.deletedAt,
        this.subjobId,
        this.shopName,
        this.shopcode,
        this.subjobDate,
        this.recceData,
    });

    factory intallerListData.fromJson(Map<String, dynamic> json) => intallerListData(
        id: json["id"]??0,
        importId: json["import_id"]??0,
        jobType: json["job_type"]??'',
        jobCardPrefix: json["job_card_prefix"]??'',
        jobcard: json["jobcard"]??'',
        clientName: json["client_name"]??'',
        scopeOfWork: json["scope_of_work"]??'',
        address: json["address"]??'',
        city: json["city"]??'',
        state: json["state"]??'',
        gstNumber: json["gst_number"]??'',
        estimateNumber: json["estimate_number"]??'',
        poNumber: json["po_number"]??'',
        poDate: json["po_date"]??'',
        jcDate: json["jc_date"] == null ? null : DateTime.parse(json["jc_date"]),
        targetCompletionDate: json["target_completion_date"] == null ? null : DateTime.parse(json["target_completion_date"]),
        particular: json["particular"]??'',
        qty: json["qty"]??'',
        rate: json["rate"]??'',
        value: json["value"]??'',
        marketterId: json["marketter_id"]??'',
        prodManagerId: json["prod_manager_id"]??'',
        dataOperatorId: json["data_operator_id"]??'',
        designerId: json["designer_id"]??'',
        recceId: json["recce_id"]??'',
        production: json["production"]??'',
        designing: json["designing"]??'',
        data: json["data"]??'',
        installerId: json["installer_id"]??'',
        installerStatus: json["installer_status"]??'',
        status: json["status"]??'',
        isReceeVerrified: json["is_recee_verrified"]??'',
        region: json["region"]??'',
        areaName: json["area_name"]??'',
        dealerName: json["dealer_name"]??'',
        storeName: json["store_name"]??'',
        jobStatus: json["job_status"]??'',
        contact: json["contact"]??'',
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        isDeleted: json["is_deleted"]??'',
        deletedAt: json["deleted_at"]??'',
        subjobId: json["subjobId"]??'',
        shopName: json["shop_name"]??'',
        shopcode: json["shopcode"]??'',
        subjobDate: json["subjobDate"] == null ? null : DateTime.parse(json["subjobDate"]),
        recceData: json["recceData"] == null ? null : RecceData.fromJson(json["recceData"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "import_id": importId,
        "job_type": jobType,
        "job_card_prefix": jobCardPrefix,
        "jobcard": jobcard,
        "client_name": clientName,
        "scope_of_work": scopeOfWork,
        "address": address,
        "city": city,
        "state": state,
        "gst_number": gstNumber,
        "estimate_number": estimateNumber,
        "po_number": poNumber,
        "po_date": poDate,
        "jc_date": "${jcDate!.year.toString().padLeft(4, '0')}-${jcDate!.month.toString().padLeft(2, '0')}-${jcDate!.day.toString().padLeft(2, '0')}",
        "target_completion_date": "${targetCompletionDate!.year.toString().padLeft(4, '0')}-${targetCompletionDate!.month.toString().padLeft(2, '0')}-${targetCompletionDate!.day.toString().padLeft(2, '0')}",
        "particular": particular,
        "qty": qty,
        "rate": rate,
        "value": value,
        "marketter_id": marketterId,
        "prod_manager_id": prodManagerId,
        "data_operator_id": dataOperatorId,
        "designer_id": designerId,
        "recce_id": recceId,
        "production": production,
        "designing": designing,
        "data": data,
        "installer_id": installerId,
        "installer_status": installerStatus,
        "status": status,
        "is_recee_verrified": isReceeVerrified,
        "region": region,
        "area_name": areaName,
        "dealer_name": dealerName,
        "store_name": storeName,
        "job_status": jobStatus,
        "contact": contact,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "is_deleted": isDeleted,
        "deleted_at": deletedAt,
        "subjobId": subjobId,
        "shop_name": shopName,
        "shopcode": shopcode,
        "subjobDate": subjobDate?.toIso8601String(),
        "recceData": recceData?.toJson(),
    };
}

class RecceData {
    int? id;
    String? userId;
    String? clientId;
    String? installerId;
    String? jobCard;
    String? withColumn;
    String? heightColumn;
    String? squareFit;
    String? dimension;
    String? signageType;
    String? signageDetails;
    List<String>? beforeImages;
    List<String>? afterImages;
    String? isReceeVerrified;
    String? isJobCompleted;
    String? isPrinting;
    DateTime? createdAt;
    DateTime? updatedAt;

    RecceData({
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
    });

    factory RecceData.fromJson(Map<String, dynamic> json) => RecceData(
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
        beforeImages: json["before_images"] == null ? [] : List<String>.from(json["before_images"]!.map((x) => x)),
        afterImages: json["after_images"] == null ? [] : List<String>.from(json["after_images"]!.map((x) => x)),
        isReceeVerrified: json["is_recee_verrified"]??'',
        isJobCompleted: json["is_job_completed"]??'',
        isPrinting: json["isPrinting"]??'',
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
        "dimension": dimension,
        "signage_type": signageType,
        "signage_details": signageDetails,
        "before_images": beforeImages == null ? [] : List<dynamic>.from(beforeImages!.map((x) => x)),
        "after_images": afterImages == null ? [] : List<dynamic>.from(afterImages!.map((x) => x)),
        "is_recee_verrified": isReceeVerrified,
        "is_job_completed": isJobCompleted,
        "isPrinting": isPrinting,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
