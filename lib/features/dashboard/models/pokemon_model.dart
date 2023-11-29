class Pokemon {
  int id;
  String name;
  String picture;

  Pokemon({
    required this.id,
    required this.name,
    required this.picture,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        id: json["id"] ?? '',
        name: json["name"] ?? '',
        picture:
            json["sprites"]['other']['official-artwork']['front_default'] ?? '',
      );
}
