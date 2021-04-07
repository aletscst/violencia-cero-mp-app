import 'dart:convert';

AttentionCenter attentionCenterFromJson(String str) =>
    AttentionCenter.fromJson(json.decode(str));

String attentionCenterToJson(AttentionCenter data) =>
    json.encode(data.toJson());

class AttentionCenter {
  AttentionCenter({
    this.status,
    this.data,
  });

  bool status;
  List<Datum> data;

  factory AttentionCenter.fromJson(Map<String, dynamic> json) =>
      AttentionCenter(
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
    this.descripcion,
    this.direccion,
    this.nombre,
    this.lat,
    this.long,
  });

  int id;
  String descripcion;
  String direccion;
  String nombre;
  double lat;
  double long;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        descripcion: json["descripcion"],
        direccion: json["direccion"],
        nombre: json["nombre"],
        lat: json["lat"].toDouble(),
        long: json["long"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "descripcion": descripcion,
        "direccion": direccion,
        "nombre": nombre,
        "lat": lat,
        "long": long,
      };
}
