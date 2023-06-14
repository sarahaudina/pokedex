import 'package:dio/dio.dart';
import 'package:movas/movas.dart';
import 'package:pokedex/movas/services/http/base_http_service.dart';
import 'package:pokedex/movas/services/http/dio_http_service.dart';
import 'package:pokedex/movas/services/pokemon_collection/base_pokemon_collection_service.dart';
import 'package:pokedex/movas/services/pokemon_collection/pokemon_collection_service.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> serviceProviders = [
  Provider<BaseHttpService>(
    create: (context) => MobileDioHttpService(
        Dio(),
      baseUrl: "https://pokeapi.co/api/v2"
    ),
  ),
  Provider<BasePokemonCollectionService>(
    create: (context) => PokemonCollectionService(
        StaticProvider.of(context), StaticProvider.of(context), StaticProvider.of(context), StaticProvider.of(context), StaticProvider.of(context)),
  )
];