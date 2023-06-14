import 'package:movas/movas.dart';
import 'package:pokedex/movas/models/http_responses/get_pokemon_color_http_response.dart';
import 'package:pokedex/movas/models/http_responses/get_pokemon_details_http_response.dart';
import 'package:pokedex/movas/models/http_responses/get_pokemon_type_http_response.dart';
import 'package:pokedex/movas/models/http_responses/get_pokemons_http_response.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> streamProviders = [
  Provider<PublishSubject<GetPokemonColorHttpResponse>>(
    lazy: false,
    create: (context) => PublishSubject(sync: true),
    dispose: (_, stream) => stream.close(),
  ),
  Provider<PublishSubject<GetPokemonTypeHttpResponse>>(
    lazy: false,
    create: (context) => PublishSubject(sync: true),
    dispose: (_, stream) => stream.close(),
  ),
  Provider<PublishSubject<GetPokemonsHttpResponse>>(
    lazy: false,
    create: (context) => PublishSubject(sync: true),
    dispose: (_, stream) => stream.close(),
  ),
  Provider<PublishSubject<GetPokemonDetailsHttpResponse>>(
    lazy: false,
    create: (context) => PublishSubject(sync: true),
    dispose: (_, stream) => stream.close(),
  )
];