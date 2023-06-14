import 'package:pokedex/movas/models/http_responses/get_pokemon_details_http_response.dart';

class PokemonDetailsO {
  final int id;
  final String name;
  final String species;
  final int weight;
  final int height;
  final List<String> abilities;
  final Stats stats;
  final List<Move> moves;

  factory PokemonDetailsO.fromEntity(GetPokemonDetailsHttpResponse entity) {
    return PokemonDetailsO(entity.id, entity.name, entity.species, entity.weight, entity.height, entity.abilities, entity.stats, entity.moves);
  }

  PokemonDetailsO(this.id, this.name, this.species, this.weight, this.height, this.abilities, this.stats, this.moves);
}

class Stats {
  final int hp;
  final int attack;
  final int defense;
  final int spAttack;
  final int spDefense;
  final int speed;

  Stats(
      {
        required this.hp,
        required this.attack,
        required this.defense,
        required this.spAttack,
        required this.spDefense,
        required this.speed});
}

class Move {
  final String name;
  final List<VersionGroupDetail> versionGroupDetails;

  Move({required this.name, required this.versionGroupDetails});
}

class VersionGroupDetail {
  final int levelLearnedAt;
  final String moveLearnMethod;
  final String versionGroup;

  VersionGroupDetail(
      {required this.levelLearnedAt, required this.moveLearnMethod, required this.versionGroup});
}