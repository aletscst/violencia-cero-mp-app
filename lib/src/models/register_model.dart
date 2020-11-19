import 'dart:convert';

Register registerFromJson(String str) => Register.fromJson(json.decode(str));

String registerToJson(Register data) => json.encode(data.toJson());

class Register {
  Register({
    this.nombre,
    this.apellidoP,
    this.apellidoM,
    this.email,
    this.tel,
    this.cp,
    this.password,
  });

  String nombre;
  String apellidoP;
  String apellidoM;
  String email;
  String tel;
  String cp;
  String password;

  factory Register.fromJson(Map<String, dynamic> json) => Register(
        nombre: json["nombre"],
        apellidoP: json["apellidoP"],
        apellidoM: json["apellidoM"],
        email: json["email"],
        tel: json["tel"],
        cp: json["cp"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "apellidoP": apellidoP,
        "apellidoM": apellidoM,
        "email": email,
        "tel": tel,
        "cp": cp,
        "password": password,
      };
}
