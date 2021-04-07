class Parrafo {
  Parrafo({
    this.link,
    this.texto,
  });

  String link;
  String texto;

  factory Parrafo.fromJson(Map<String, dynamic> json) => Parrafo(
        link: json["link"],
        texto: json["texto"],
      );

  Map<String, dynamic> toJson() => {
        "link": link,
        "texto": texto,
      };
}
