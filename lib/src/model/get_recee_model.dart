// To parse this JSON data, do
//
//     final getReceeModel = getReceeModelFromJson(jsonString);

import 'dart:convert';

GetReceeModel getReceeModelFromJson(String str) => GetReceeModel.fromJson(json.decode(str));

String getReceeModelToJson(GetReceeModel data) => json.encode(data.toJson());

class GetReceeModel {
    bool status;
    List<GetReceDataList> data;

    GetReceeModel({
        required this.status,
        required this.data,
    });

    factory GetReceeModel.fromJson(Map<String, dynamic> json) => GetReceeModel(
        status: json["status"],
        data: List<GetReceDataList>.from(json["data"].map((x) => GetReceDataList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class GetReceDataList {
    int id;
    dynamic importId;
    String? clientId;
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
    String? recceId;
    String production;
    String designing;
    String data;
    String? installerId;
    String installerStatus;
    String status;
    String isReceeVerrified;
    String region;
    String areaName;
    String dealerName;
    String storeName;
    String contact;
    DateTime createdAt;
    DateTime updatedAt;
    String isDeleted;
    dynamic deletedAt;
    List<GetReceDataList>? getClientJobData;

    GetReceDataList({
        required this.id,
        required this.importId,
        this.clientId,
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
        required this.region,
        required this.areaName,
        required this.dealerName,
        required this.storeName,
        required this.contact,
        required this.createdAt,
        required this.updatedAt,
        required this.isDeleted,
        required this.deletedAt,
        this.getClientJobData,
    });

    factory GetReceDataList.fromJson(Map<String, dynamic> json) => GetReceDataList(
        id: json["id"],
        importId: json["import_id"],
        clientId: json["client_id"],
        jobcard: json["jobcard"],
        clientName: json["client_name"],
        scopeOfWork: json["scope_of_work"],
        address: json["address"],
        city: json["city"],
        state: json["state"],
        gstNumber: json["gst_number"],
        estimateNumber: json["estimate_number"],
        poNumber: json["po_number"],
        poDate: DateTime.parse(json["po_date"]),
        targetCompletionDate: DateTime.parse(json["target_completion_date"]),
        particular: json["particular"],
        qty: json["qty"],
        rate: json["rate"],
        value: json["value"],
        marketterId: json["marketter_id"],
        recceId: json["recce_id"],
        production: json["production"],
        designing: json["designing"],
        data: json["data"],
        installerId: json["installer_id"],
        installerStatus: json["installer_status"],
        status: json["status"],
        isReceeVerrified: json["is_recee_verrified"],
        region: json["region"],
        areaName: json["area_name"],
        dealerName: json["dealer_name"],
        storeName: json["store_name"],
        contact: json["contact"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        isDeleted: json["is_deleted"],
        deletedAt: json["deleted_at"],
        getClientJobData: json["get_client_job_data"] == null ? [] : List<GetReceDataList>.from(json["get_client_job_data"]!.map((x) => GetReceDataList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "import_id": importId,
        "client_id": clientId,
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
        "region": region,
        "area_name": areaName,
        "dealer_name": dealerName,
        "store_name": storeName,
        "contact": contact,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "is_deleted": isDeleted,
        "deleted_at": deletedAt,
        "get_client_job_data": getClientJobData == null ? [] : List<dynamic>.from(getClientJobData!.map((x) => x.toJson())),
    };
}
