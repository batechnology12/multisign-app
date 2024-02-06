// To parse this JSON data, do
//
//     final getProfileModel = getProfileModelFromJson(jsonString);

import 'dart:convert';

GetProfileModel getProfileModelFromJson(String str) => GetProfileModel.fromJson(json.decode(str));

String getProfileModelToJson(GetProfileModel data) => json.encode(data.toJson());

class GetProfileModel {
    bool status;
    String message;
    Data data;

    GetProfileModel({
        required this.status,
        required this.message,
        required this.data,
    });

    factory GetProfileModel.fromJson(Map<String, dynamic> json) => GetProfileModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    int userId;
    String roleId;
    String name;
    String email;
    String mobile;
    String city;
    String createdAt;

    Data({
        required this.userId,
        required this.roleId,
        required this.name,
        required this.email,
        required this.mobile,
        required this.city,
        required this.createdAt,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        userId: json["user_id"],
        roleId: json["role_id"],
        name: json["name"],
        email: json["email"],
        mobile: json["mobile"],
        city: json["city"],
        createdAt: json["created_at"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "role_id": roleId,
        "name": name,
        "email": email,
        "mobile": mobile,
        "city": city,
        "created_at": createdAt,
    };
}
