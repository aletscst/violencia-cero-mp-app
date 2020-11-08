import 'dart:convert';

import 'package:violencia_cero/src/models/parrafo_model.dart';

ProcedureDetail procedureDetailFromJson(String str) =>
    ProcedureDetail.fromJson(json.decode(str));

String procedureDetailToJson(ProcedureDetail data) =>
    json.encode(data.toJson());

class ProcedureDetail {
  ProcedureDetail({
    this.id,
    this.titulo,
    this.parrafos,
  });

  String id;
  String titulo;
  List<Parrafo> parrafos;

  factory ProcedureDetail.fromJson(Map<String, dynamic> json) =>
      ProcedureDetail(
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
