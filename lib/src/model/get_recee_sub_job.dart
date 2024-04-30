// To parse this JSON data, do
//
//     final getReceeSubjob = getReceeSubjobFromJson(jsonString);

import 'dart:convert';

GetReceeSubjob getReceeSubjobFromJson(String str) => GetReceeSubjob.fromJson(json.decode(str));

String getReceeSubjobToJson(GetReceeSubjob data) => json.encode(data.toJson());

class GetReceeSubjob {
    bool? status;
    List<Datum>? data;

    GetReceeSubjob({
        this.status,
        this.data,
    });

    factory GetReceeSubjob.fromJson(Map<String, dynamic> json) => GetReceeSubjob(
        status: json["status"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    int? id;
    String? importId;
    String? clientId;
    String? shopcode;
    String? shopName;
    String? address;
    String? city;
    String? gstNumber;
    String? recceId;
    dynamic installerId;
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

    Datum({
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
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
    };
}
