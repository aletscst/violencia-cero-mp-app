class Parrafo {
  Parrafo({
    this.subtitulo,
    this.texto,
  });

  String subtitulo;
  String texto;

  factory Parrafo.fromJson(Map<String, dynamic> json) => Parrafo(
        subtitulo: json["subtitulo"],
        texto: json["texto"],
      );

  Map<String, dynamic> toJson() => {
        "subtitulo": subtitulo,
        "texto": texto,
      };
}
