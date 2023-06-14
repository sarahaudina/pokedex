import 'dart:math';

import 'package:pokedex/movas/models/pokemon_model.dart';

class PokemonO {
  final int id;
  final String url;
  final String name;
  final String color;
  final List<String> types;

  PokemonO(this.id, this.url, this.name, this.color, this.types);

  factory PokemonO.fromEntity(Pokemon entity, String color, List<String> types) {
    return PokemonO(entity.id, entity.url, entity.name, color, types);
  }
}