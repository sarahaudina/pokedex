import 'package:movas/movas.dart';
import 'package:pokedex/movas/models/http_requests/get_color_http_request.dart';
import 'package:pokedex/movas/models/http_requests/get_pokemon_details_http_request.dart';
import 'package:pokedex/movas/models/http_requests/get_pokemons_http_request.dart';
import 'package:pokedex/movas/models/http_requests/get_type_http_request.dart';
import 'package:pokedex/movas/models/http_responses/get_pokemon_color_http_response.dart';
import 'package:pokedex/movas/models/http_responses/get_pokemon_details_http_response.dart';
import 'package:pokedex/movas/models/http_responses/get_pokemon_type_http_response.dart';
import 'package:pokedex/movas/models/http_responses/get_pokemons_http_response.dart';
import 'package:pokedex/movas/observables/pokemon_detailed_o.dart';
import 'package:pokedex/movas/observables/pokemon_o.dart';
import 'package:pokedex/movas/services/http/base_http_service.dart';
import 'package:pokedex/movas/services/pokemon_collection/base_pokemon_collection_service.dart';
import 'package:pokedex/riverpod/repositories/pokemon/pokemon_repository.dart';

class HttpPokemonRepository extends PokemonRepository {
  final BaseHttpService httpService;

  HttpPokemonRepository(this.httpService);

  @override
  Future<List<PokemonO>> getPokemons({int? offset}) async {
    GetPokemonsHttpResponse result = await httpService.get(
        request: GetPokemonsHttpRequest(offset ?? 0),
        converter: (res) => GetPokemonsHttpResponse.fromMap(res)
    );

    List<PokemonO> newPokemons = [];
    for (var i in result.pokemons) {
      var color;// = currentColorMap?.mapOfColors[i.name];
      var types;// = currentTypesMap?.mapOfTypes[i.name];

      // print('${i.id} poke ${i.name} is $color $types');

      newPokemons.add(PokemonO(i.id, i.url, i.name, color ?? "", types ?? []));
    }

    return newPokemons;
  }

  @override
  Future<PokemonDetailsO> getPokemon(String name) async {
    GetPokemonDetailsHttpResponse result = await httpService.get(
      request: GetPokemonDetailsHttpRequest(name),
      converter: (map) => GetPokemonDetailsHttpResponse.fromMap(map)
    );

    print('getPokemonDetail ${result}');

    return PokemonDetailsO.fromEntity(result);
  }

  int? getIdFromUrl(String url) {
    List urlSubs = url.split('/');
    if (urlSubs[urlSubs.length-2] is int) {
      return urlSubs[urlSubs.length - 2];
    } else {
      return null;
    }
  }
}