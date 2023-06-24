
import 'package:pokedex/movas/models/http_requests/get_color_http_request.dart';
import 'package:pokedex/movas/models/http_requests/get_type_http_request.dart';
import 'package:pokedex/movas/models/http_responses/get_pokemon_color_http_response.dart';
import 'package:pokedex/movas/models/http_responses/get_pokemon_type_http_response.dart';
import 'package:pokedex/movas/observables/pokemon_colors_o.dart';
import 'package:pokedex/riverpod/models/metadata.dart';
import 'package:pokedex/riverpod/repositories/metadata/metadata_repository.dart';
import 'package:pokedex/riverpod/services/http/base_http_service.dart';

class HttpMetadataRepository extends MetadataRepository {
  final BaseHttpService httpService;

  HttpMetadataRepository(this.httpService);

  @override
  Future<void> getColors() async {
    for (int i=1; i<=10; i++) {
      GetPokemonColorHttpResponse result = await httpService.get(
          request: GetColorHttpRequest(i),
          converter: (res) => GetPokemonColorHttpResponse.fromMap(res)
      );
      // print('getColors ${result.mapOfColors}');
    }

    return;
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
    }

    return;
  }

  Future<MetadataO?> getMetadata() async {
    var colors = await getColors();
    var types = await getTypes();

    // ToDo: implement metadata repository using riverpod
    late MetadataO metadataO; // = MetadataO(, typesO)

    return metadataO ?? null;
  }
}