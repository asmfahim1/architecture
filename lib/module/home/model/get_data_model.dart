// To parse this JSON data, do
//
//     final getCommentsModel = getCommentsModelFromJson(jsonString);

import 'dart:convert';

List<GetCommentsModel> getCommentsModelFromJson(String str) =>
    List<GetCommentsModel>.from(
        json.decode(str).map((x) => GetCommentsModel.fromJson(x)));

String getCommentsModelToJson(List<GetCommentsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetCommentsModel {
  int? postId;
  int? id;
  String? name;
  String? email;
  String? body;

  GetCommentsModel({
    this.postId,
    this.id,
    this.name,
    this.email,
    this.body,
  });

  factory GetCommentsModel.fromJson(Map<String, dynamic> json) =>
      GetCommentsModel(
        postId: json["postId"],
        id: json["id"],
        name: json["name"],
        email: json["email"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "postId": postId,
        "id": id,
        "name": name,
        "email": email,
        "body": body,
      };
}
