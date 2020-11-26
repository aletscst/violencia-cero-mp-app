import 'dart:convert';

import 'package:violencia_cero/src/models/parrafo_model.dart';

ProcedureDetail procedureDetailFromJson(String str) =>
    ProcedureDetail.fromJson(json.decode(str));

String procedureDetailToJson(ProcedureDetail data) =>
    json.encode(data.toJson());

class ProcedureDetail {
  ProcedureDetail({
    this.id,
    this.estatus,
    this.titulo,
    this.parrafos,
  });

  int id;
  String estatus;
  String titulo;
  List<Parrafo> parrafos;

  factory ProcedureDetail.fromJson(Map<String, dynamic> json) =>
      ProcedureDetail(
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
