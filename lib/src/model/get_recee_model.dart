// To parse this JSON data, do
//
//     final getReceeModel = getReceeModelFromJson(jsonString);

import 'dart:convert';

GetReceeModel getReceeModelFromJson(String str) => GetReceeModel.fromJson(json.decode(str));

String getReceeModelToJson(GetReceeModel data) => json.encode(data.toJson());

class GetReceeModel {
    bool? status;
    List<GetRaceDataList> data;

    GetReceeModel({
        this.status,
        required this.data,
    });

    factory GetReceeModel.fromJson(Map<String, dynamic> json) => GetReceeModel(
        status: json["status"],
        data: json["data"] == null ? [] : List<GetRaceDataList>.from(json["data"]!.map((x) => GetRaceDataList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class GetRaceDataList {
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

    GetRaceDataList({
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
    });

    factory GetRaceDataList.fromJson(Map<String, dynamic> json) => GetRaceDataList(
        id: json["id"]??0,
        importId: json["import_id"]??'',
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
    };
}
