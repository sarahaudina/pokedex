import 'package:movas/movas.dart';
import 'package:pokedex/riverpod/observables/pokemon_detailed_o.dart';
import 'package:pokedex/riverpod/observables/pokemon_o.dart';
import 'package:pokedex/riverpod/models/http_requests/get_pokemon_details_http_request.dart';
import 'package:pokedex/riverpod/models/http_requests/get_pokemons_http_request.dart';
import 'package:pokedex/riverpod/models/http_responses/get_pokemon_details_http_response.dart';
import 'package:pokedex/riverpod/models/http_responses/get_pokemons_http_response.dart';
import 'package:pokedex/riverpod/repositories/pokemon/pokemon_repository.dart';
import 'package:pokedex/riverpod/services/http/http_service.dart';

class HttpPokemonRepository extends PokemonRepository {
  final HttpService httpService;

  HttpPokemonRepository(this.httpService) : super();

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