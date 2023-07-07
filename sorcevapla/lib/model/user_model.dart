import 'dart:convert';

UserModel userModelFromJson(String str) =>
    UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    required this.userId,
    required this.email,
    required this.password,
    required this.name,
    required this.displayName,
  });

  String? userId;
  String? email;
  String? password;
  String? name;
  String? displayName;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userId: json["userId"],
        email: json["email"],
        password: json["password"],
        name: json["name"],
        displayName: json["displayName"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "email": email,
        "password": password,
        "name": name,
        "displayName": displayName,
      };
}