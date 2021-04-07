import 'dart:convert';

UpdatePassword updatePasswordFromJson(String str) =>
    UpdatePassword.fromJson(json.decode(str));

String updatePasswordToJson(UpdatePassword data) => json.encode(data.toJson());

class UpdatePassword {
  UpdatePassword({
    this.id,
    this.email,
    this.code,
    this.password,
  });

  int id;
  String email;
  String code;
  String password;

  factory UpdatePassword.fromJson(Map<String, dynamic> json) => UpdatePassword(
        id: json["id"],
        email: json["email"],
        code: json["code"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "code": code,
        "password": password,
      };
}
