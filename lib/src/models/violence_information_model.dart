import 'dart:convert';

ViolenceInformation violenceInfoFromJson(String str) =>
    ViolenceInformation.fromJson(json.decode(str));

String violenceInfoToJson(ViolenceInformation data) =>
    json.encode(data.toJson());

class ViolenceInformation {
  ViolenceInformation({
    this.status,
    this.data,
  });

  bool status;
  List<Datum> data;

  factory ViolenceInformation.fromJson(Map<String, dynamic> json) =>
      ViolenceInformation(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.nombre,
  });

  int id;
  String nombre;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        nombre: json["nombre"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
      };
}
