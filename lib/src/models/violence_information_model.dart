import 'dart:convert';

ViolenceInformation violenceInformationFromJson(String str) =>
    ViolenceInformation.fromJson(json.decode(str));

String violenceInformationToJson(ViolenceInformation data) =>
    json.encode(data.toJson());

class ViolenceInformation {
  ViolenceInformation({
    this.id,
    this.nombre,
  });

  String id;
  String nombre;

  factory ViolenceInformation.fromJson(Map<String, dynamic> json) =>
      ViolenceInformation(
        id: json["id"],
        nombre: json["nombre"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
      };
}
