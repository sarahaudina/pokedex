
import 'package:pokedex/riverpod/models/pokemon_model.dart';

class GetPokemonsHttpResponse {
  final List<Pokemon> pokemons;

  GetPokemonsHttpResponse(this.pokemons);

  factory GetPokemonsHttpResponse.fromMap(Map<dynamic, dynamic> map) {
    List<Pokemon> pokemons = [];
    for (Map i in map['results']) {
      pokemons.add(Pokemon(getIdFromUrl(i['url']) ?? 0, i['url'], i['name']));
    }

    return GetPokemonsHttpResponse(pokemons);
  }

  static int? getIdFromUrl(String url) {
    List urlSubs = url.split('/');
    if (urlSubs[urlSubs.length-2] is int) {
      return urlSubs[urlSubs.length - 2];
    } else {
      return null;
    }
  }

}