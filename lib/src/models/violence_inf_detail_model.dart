import 'dart:convert';

import 'package:violencia_cero/src/models/parrafo_model.dart';

ViolenceInfoDetail violenceInfoDetailFromJson(String str) =>
    ViolenceInfoDetail.fromJson(json.decode(str));

String violenceInfoDetailToJson(ViolenceInfoDetail data) =>
    json.encode(data.toJson());

class ViolenceInfoDetail {
  ViolenceInfoDetail({
    this.id,
    this.estatus,
    this.titulo,
    this.parrafos,
  });

  int id;
  String estatus;
  String titulo;
  List<Parrafo> parrafos;

  factory ViolenceInfoDetail.fromJson(Map<String, dynamic> json) =>
      ViolenceInfoDetail(
        id: json["id"],
        estatus: json["estatus"],
        titulo: json["titulo"],
        parrafos: List<Parrafo>.from(
            json["parrafos"].map((x) => Parrafo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "estatus": estatus,
        "titulo": titulo,
        "parrafos": List<dynamic>.from(parrafos.map((x) => x.toJson())),
      };
}
