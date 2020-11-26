import 'dart:convert';

Procedure procedureFromJson(String str) => Procedure.fromJson(json.decode(str));

String procedureToJson(Procedure data) => json.encode(data.toJson());

class Procedure {
  Procedure({
    this.status,
    this.data,
  });

  bool status;
  List<Datum> data;

  factory Procedure.fromJson(Map<String, dynamic> json) => Procedure(
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
