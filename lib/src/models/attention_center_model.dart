import 'dart:convert';

import 'dart:ffi';

AttentionCenter attentionCenterFromJson(String str) =>
    AttentionCenter.fromJson(json.decode(str));

String attentionCenterToJson(AttentionCenter data) =>
    json.encode(data.toJson());

class AttentionCenter {
  AttentionCenter({
    this.nombre,
    this.descripcion,
    this.direccion,
    this.lng,
    this.lat,
  });

  String nombre;
  String descripcion;
  String direccion;
  double lng;
  double lat;

  factory AttentionCenter.fromJson(Map<String, dynamic> json) =>
      AttentionCenter(
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        direccion: json["direccion"],
        lng: json["lng"],
        lat: json["lat"],
      );

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "descripcion": descripcion,
        "direccion": direccion,
        "lng": lng,
        "lat": lat,
      };
}
