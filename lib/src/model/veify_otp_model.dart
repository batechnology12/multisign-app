// To parse this JSON data, do
//
//     final verifyOtpModel = verifyOtpModelFromJson(jsonString);

import 'dart:convert';

VerifyOtpModel verifyOtpModelFromJson(String str) => VerifyOtpModel.fromJson(json.decode(str));

String verifyOtpModelToJson(VerifyOtpModel data) => json.encode(data.toJson());

class VerifyOtpModel {
    bool status;
    String message;
    Data data;

    VerifyOtpModel({
        required this.status,
        required this.message,
        required this.data,
    });

    factory VerifyOtpModel.fromJson(Map<String, dynamic> json) => VerifyOtpModel(
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
    String name;
    String email;
    String mobile;
    int userId;
    String roleId;

    Data({
        required this.name,
        required this.email,
        required this.mobile,
        required this.userId,
        required this.roleId,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json["name"],
        email: json["email"],
        mobile: json["mobile"],
        userId: json["user_id"],
        roleId: json["role_id"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "mobile": mobile,
        "user_id": userId,
        "role_id": roleId,
    };
}
