import 'package:flutter/material.dart';
import 'package:pokedex/utils/pokemon/pokemon_utils.dart';

class Pokemon {
  int id;
  String name;
  String picture;
  String description;
  num weight, height;
  List<String> tags, moves;
  List<Map> stats;

  Pokemon({
    required this.id,
    required this.description,
    required this.height,
    required this.weight,
    required this.name,
    required this.picture,
    required this.tags,
    required this.moves,
    required this.stats,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        id: json["id"] ?? '',
        name: json["name"] ?? '',
        description: (json["description"] ?? '').replaceAll('\n', ''),
        weight: json["weight"] ?? 0,
        height: json["height"] ?? 0,
        picture:
            json["sprites"]['other']['official-artwork']['front_default'] ?? '',
        tags: List<String>.from(json["types"].map((x) => x["type"]["name"])),
        moves: List<String>.from(
            json["abilities"].map((x) => x["ability"]["name"])),
        stats: json["stats"] != null
            ? List<Map>.from(json["stats"].map(
                (x) => {"name": x["stat"]["name"], "value": x["base_stat"]}))
            : [],
      );

  Color getPokemonPrimaryColor() {
    if (tags.isEmpty) {
      return getTagColor('fire');
    }

    return getTagColor(tags[0]);
  }
}
