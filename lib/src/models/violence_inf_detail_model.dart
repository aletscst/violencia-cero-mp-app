import 'dart:convert';

import 'package:violencia_cero/src/models/parrafo_model.dart';

ViolenceInfoDetail violenceInfoDetailFromJson(String str) =>
    ViolenceInfoDetail.fromJson(json.decode(str));

String violenceInfoDetailToJson(ViolenceInfoDetail data) =>
    json.encode(data.toJson());

class ViolenceInfoDetail {
  ViolenceInfoDetail({
    this.id,
    this.titulo,
    this.parrafos,
  });

  String id;
  String titulo;
  List<Parrafo> parrafos;

  factory ViolenceInfoDetail.fromJson(Map<String, dynamic> json) =>
      ViolenceInfoDetail(
        id: json["id"],
        titulo: json["titulo"],
        parrafos: List<Parrafo>.from(
            json["parrafos"].map((x) => Parrafo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "titulo": titulo,
        "parrafos": List<dynamic>.from(parrafos.map((x) => x.toJson())),
      };
}
