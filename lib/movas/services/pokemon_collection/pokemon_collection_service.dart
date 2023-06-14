import 'package:movas/movas.dart';
import 'package:pokedex/movas/models/http_requests/get_color_http_request.dart';
import 'package:pokedex/movas/models/http_requests/get_pokemon_details_http_request.dart';
import 'package:pokedex/movas/models/http_requests/get_pokemons_http_request.dart';
import 'package:pokedex/movas/models/http_requests/get_type_http_request.dart';
import 'package:pokedex/movas/models/http_responses/get_pokemon_color_http_response.dart';
import 'package:pokedex/movas/models/http_responses/get_pokemon_details_http_response.dart';
import 'package:pokedex/movas/models/http_responses/get_pokemon_type_http_response.dart';
import 'package:pokedex/movas/models/http_responses/get_pokemons_http_response.dart';
import 'package:pokedex/movas/services/http/base_http_service.dart';
import 'package:pokedex/movas/services/pokemon_collection/base_pokemon_collection_service.dart';

class PokemonCollectionService extends BasePokemonCollectionService {
  final BaseHttpService httpService;
  final PublishSubject<GetPokemonColorHttpResponse> getPokemonColors$;
  final PublishSubject<GetPokemonsHttpResponse> getPokemons$;
  final PublishSubject<GetPokemonTypeHttpResponse> getPokemonType$;
  final PublishSubject<GetPokemonDetailsHttpResponse> getPokemonDetails$;

  PokemonCollectionService(this.httpService, this.getPokemonColors$, this.getPokemons$, this.getPokemonType$, this.getPokemonDetails$);

  @override
  Future<void> getAllPokemons({int? page}) async {
    var result = await httpService.get(
        request: GetPokemonsHttpRequest(page ?? 0),
        converter: (res) => GetPokemonsHttpResponse.fromMap(res)
    );

    // print('getAllPokemons ${result}');

    return getPokemons$.add(result);
  }

  @override
  Future<void> getColors() async {
    for (int i=1; i<=10; i++) {
      var result = await httpService.get(
          request: GetColorHttpRequest(i),
          converter: (res) => GetPokemonColorHttpResponse.fromMap(res)
      );
      // print('getColors ${result.mapOfColors}');
      getPokemonColors$.add(result);
    }

    return;
  }

  @override
  Future<void> getPokemonDetail(String name) async {
    var result = await httpService.get(
      request: GetPokemonDetailsHttpRequest(name),
      converter: (map) => GetPokemonDetailsHttpResponse.fromMap(map)
    );

    print('getPokemonDetail ${result}');

    return getPokemonDetails$.add(result);
  }

  @override
  Future<void> getTypes() async {
    var getTypesUrlResult = await httpService.get(
        request: GetTypesUrlHttpRequest(),
    );

    // print('getTypesUrlResult ${getTypesUrlResult.toString()}');

    for (var item in getTypesUrlResult['results']) {
      var name = item['name'];
      var typeDetailResult = await httpService.get(
        request: GetTypeHttpRequest('${name}'),
        converter: (map) => GetPokemonTypeHttpResponse.fromMap(map)
      );

      // print('getTypes ${typeDetailResult}');

      getPokemonType$.add(typeDetailResult);
    }

    return;
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