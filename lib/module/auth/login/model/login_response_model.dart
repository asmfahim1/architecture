// To parse this JSON data, do
//
//     final loginResponseModel = loginResponseModelFromJson(jsonString);

import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) =>
    json.encode(data.toJson());

class LoginResponseModel {
  int? code;
  String? message;
  Data? data;

  LoginResponseModel({
    this.code,
    this.message,
    this.data,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        code: json["code"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  int? id;
  String? name;
  String? email;
  String? token;

  Data({
    this.id,
    this.name,
    this.email,
    this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["Id"],
        name: json["Name"],
        email: json["Email"],
        token: json["Token"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Name": name,
        "Email": email,
        "Token": token,
      };
}
