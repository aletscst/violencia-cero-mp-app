import 'dart:convert';

Report reportFromJson(String str) => Report.fromJson(json.decode(str));

String reportToJson(Report data) => json.encode(data.toJson());

class Report {
  Report({
    this.idUsuario,
    this.descripcionProblema = '',
    this.tipoAyuda = '',
    this.denunciado,
    this.solicitante,
  });

  int idUsuario;
  String descripcionProblema;
  String tipoAyuda;
  Denunciado denunciado;
  Solicitante solicitante;

  factory Report.fromJson(Map<String, dynamic> json) => Report(
        idUsuario: json["idUsuario"],
        descripcionProblema: json["descripcionProblema"],
        tipoAyuda: json["tipoAyuda"],
        denunciado: Denunciado.fromJson(json["denunciado"]),
        solicitante: Solicitante.fromJson(json["solicitante"]),
      );

  Map<String, dynamic> toJson() => {
        "idUsuario": idUsuario,
        "descripcionProblema": descripcionProblema,
        "tipoAyuda": tipoAyuda,
        "denunciado": denunciado.toJson(),
        "solicitante": solicitante.toJson(),
      };
}

class Denunciado {
  Denunciado({
    this.nombres = '',
    this.apellidoPaterno = '',
    this.apellidoMaterno = '',
    this.parentesco = '',
    this.edad = 20,
    this.ocupacion = '',
    this.domicilio = '',
    this.codigoPostal = '',
    this.tipoViolencia = '',
  });

  String nombres;
  String apellidoPaterno;
  String apellidoMaterno;
  String parentesco;
  int edad;
  String ocupacion;
  String domicilio;
  String codigoPostal;
  String tipoViolencia;

  factory Denunciado.fromJson(Map<String, dynamic> json) => Denunciado(
        nombres: json["nombres"],
        apellidoPaterno: json["apellidoPaterno"],
        apellidoMaterno: json["apellidoMaterno"],
        parentesco: json["parentesco"],
        edad: json["edad"],
        ocupacion: json["ocupacion"],
        domicilio: json["domicilio"],
        codigoPostal: json["codigoPostal"],
        tipoViolencia: json["tipoViolencia"],
      );

  Map<String, dynamic> toJson() => {
        "nombres": nombres,
        "apellidoPaterno": apellidoPaterno,
        "apellidoMaterno": apellidoMaterno,
        "parentesco": parentesco,
        "edad": edad,
        "ocupacion": ocupacion,
        "domicilio": domicilio,
        "codigoPostal": codigoPostal,
        "tipoViolencia": tipoViolencia,
      };
}

class Solicitante {
  Solicitante({
    this.nombres = '',
    this.apellidoPaterno = '',
    this.apellidoMaterno = '',
    this.genero = 'Mujer',
    this.edad = 20,
    this.telefono = '',
    this.lugarNacimiento = 'CDMX',
    this.domicilio = '',
    this.codigoPostal = '',
    this.escolaridad = 'Primaria',
    this.edoCivil = 'Soltera(o)',
    this.ocupacion = '',
  });

  String nombres;
  String apellidoPaterno;
  String apellidoMaterno;
  String genero;
  int edad;
  String telefono;
  String lugarNacimiento;
  String domicilio;
  String codigoPostal;
  String escolaridad;
  String edoCivil;
  String ocupacion;

  factory Solicitante.fromJson(Map<String, dynamic> json) => Solicitante(
        nombres: json["nombres"],
        apellidoPaterno: json["apellidoPaterno"],
        apellidoMaterno: json["apellidoMaterno"],
        genero: json["genero"],
        edad: json["edad"],
        telefono: json["telefono"],
        lugarNacimiento: json["lugarNacimiento"],
        domicilio: json["domicilio"],
        codigoPostal: json["codigoPostal"],
        escolaridad: json["escolaridad"],
        edoCivil: json["edoCivil"],
        ocupacion: json["ocupacion"],
      );

  Map<String, dynamic> toJson() => {
        "nombres": nombres,
        "apellidoPaterno": apellidoPaterno,
        "apellidoMaterno": apellidoMaterno,
        "genero": genero,
        "edad": edad,
        "telefono": telefono,
        "lugarNacimiento": lugarNacimiento,
        "domicilio": domicilio,
        "codigoPostal": codigoPostal,
        "escolaridad": escolaridad,
        "edoCivil": edoCivil,
        "ocupacion": ocupacion,
      };
}
