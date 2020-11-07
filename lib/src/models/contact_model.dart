class Contact {
  String id;
  String name;
  String description;
  String number;

  Contact({this.id, this.name, this.description, this.number});

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        number: json["number"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "number": number,
      };
}
