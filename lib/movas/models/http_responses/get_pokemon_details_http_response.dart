import 'package:pokedex/movas/observables/pokemon_detailed_o.dart';

class GetPokemonDetailsHttpResponse {
  final int id;
  final String name;
  final String species;
  final int weight;
  final int height;
  final List<String> abilities;
  final Stats stats;
  final List<Move> moves;

  factory GetPokemonDetailsHttpResponse.fromMap(Map<dynamic, dynamic> map) {
    List<String> abilities = [];
    for (var i in map['abilities']) {
      abilities.add(i['ability']['name'])  ;
    }

    List<Move> moves = [];
    for (var i in map['moves']) {
      List<VersionGroupDetail> vgDetails = [];
      for (var j in i['version_group_details']) {
        vgDetails.add(VersionGroupDetail(
            levelLearnedAt: j['level_learned_at'],
            moveLearnMethod: j['move_learn_method']['name'],
            versionGroup: j['version_group']['name']));
      }

      moves.add(
        Move(name: i['move']['name'], versionGroupDetails: vgDetails)
      );
    }
    
    return GetPokemonDetailsHttpResponse(
      id: map['id'],
      name: map['name'],
      species: map['species']['name'],
      weight: map['weight'],
      height: map['height'],
      abilities: abilities,
      stats: Stats(
        spAttack: (map['stats'] as List<dynamic>).firstWhere((el) => el['stat']['name']=='special-attack')['base_stat'],
        spDefense: (map['stats'] as List<dynamic>).firstWhere((el) => el['stat']['name']=='special-attack')['base_stat'],
        attack: (map['stats'] as List<dynamic>).firstWhere((el) => el['stat']['name']=='attack')['base_stat'],
        defense: (map['stats'] as List<dynamic>).firstWhere((el) => el['stat']['name']=='defense')['base_stat'],
        speed: (map['stats'] as List<dynamic>).firstWhere((el) => el['stat']['name']=='speed')['base_stat'],
        hp: (map['stats'] as List<dynamic>).firstWhere((el) => el['stat']['name']=='hp')['base_stat']
      ),
      moves: moves
    );
  }

  GetPokemonDetailsHttpResponse(
      {
        required this.id,
        required this.name,
        required this.species,
        required this.weight,
        required this.height,
        required this.abilities,
        required this.stats,
        required this.moves});
}