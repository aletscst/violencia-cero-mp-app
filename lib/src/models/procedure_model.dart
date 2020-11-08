import 'dart:convert';

Procedure procedureFromJson(String str) => Procedure.fromJson(json.decode(str));

String procedureToJson(Procedure data) => json.encode(data.toJson());

class Procedure {
  Procedure({
    this.id,
    this.nombre,
  });

  String id;
  String nombre;

  factory Procedure.fromJson(Map<String, dynamic> json) => Procedure(
        id: json["id"],
        nombre: json["nombre"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
      };
}
