import 'package:pokedex/riverpod/observables/pokemon_colors_o.dart';
import 'package:pokedex/riverpod/observables/pokemon_detailed_o.dart';
import 'package:pokedex/riverpod/observables/pokemon_types_o.dart';
import 'package:pokedex/riverpod/models/http_requests/get_color_http_request.dart';
import 'package:pokedex/riverpod/models/http_requests/get_type_http_request.dart';
import 'package:pokedex/riverpod/models/http_responses/get_pokemon_color_http_response.dart';
import 'package:pokedex/riverpod/models/http_responses/get_pokemon_type_http_response.dart';
import 'package:pokedex/riverpod/models/metadata.dart';
import 'package:pokedex/riverpod/repositories/metadata/metadata_repository.dart';
import 'package:pokedex/riverpod/services/http/http_service.dart';

class HttpMetadataRepository extends MetadataRepository {
  final HttpService httpService;

  HttpMetadataRepository(this.httpService);

  @override
  Future<PokemonColorsO> getColors() async {
    Map<String, String> mapOfColors = {};
    List<String> colors = [];

    for (int i=1; i<=10; i++) {
      GetPokemonColorHttpResponse result = await httpService.get(
          request: GetColorHttpRequest(i),
          converter: (res) => GetPokemonColorHttpResponse.fromMap(res)
      );
      // print('getColors ${result.mapOfColors}');
      mapOfColors = updatePokemonColors(mapOfColors, result);
      colors.add(result.color);
    }

    return PokemonColorsO(mapOfColors: mapOfColors, colors: colors);
  }

  @override
  Future<PokemonTypesO> getTypes() async {
    var getTypesUrlResult = await httpService.get(
      request: GetTypesUrlHttpRequest(),
    );

    // print('getTypesUrlResult ${getTypesUrlResult.toString()}');
    Map<String, List<String>> mapOfTypes = {};
    List<String> types = [];

    for (var item in getTypesUrlResult['results']) {
      var name = item['name'];
      GetPokemonTypeHttpResponse typeDetailResult = await httpService.get(
          request: GetTypeHttpRequest('${name}'),
          converter: (map) => GetPokemonTypeHttpResponse.fromMap(map)
      );

      mapOfTypes = updatePokemonTypes(mapOfTypes, typeDetailResult);
      types.add(name);
      // print('getTypes ${typeDetailResult}');
    }

    return PokemonTypesO(mapOfTypes: mapOfTypes, types: types);
  }

  Map<String, List<String>> updatePokemonTypes(Map<String, List<String>> updatedMapOfTypes, GetPokemonTypeHttpResponse p1) {
    for (String pokemon in p1.pokemons) {
      if (updatedMapOfTypes[pokemon]!=null) {
        updatedMapOfTypes[pokemon] = updatedMapOfTypes[pokemon]!..add(p1.type);
      } else {
        updatedMapOfTypes[pokemon] = [p1.type];
      }
    }

    return updatedMapOfTypes;
  }

  Map<String, String> updatePokemonColors(Map<String, String> mapOfColors, GetPokemonColorHttpResponse response) {
    mapOfColors.addAll(response.mapOfColors);
    return mapOfColors;
  }

  Future<MetadataO?> getMetadata() async {
    var colors = await getColors();
    var types = await getTypes();

    return MetadataO(colors, types);
  }
}