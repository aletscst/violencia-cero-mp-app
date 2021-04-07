import 'dart:convert';

GenericResponse genericResponseFromJson(String str) =>
    GenericResponse.fromJson(json.decode(str));

String genericResponseToJson(GenericResponse data) =>
    json.encode(data.toJson());

class GenericResponse {
  GenericResponse({
    this.id,
    this.status,
    this.message,
  });

  int id;
  bool status;
  String message;

  factory GenericResponse.fromJson(Map<String, dynamic> json) =>
      GenericResponse(
        id: json["id"],
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "message": message,
      };
}
