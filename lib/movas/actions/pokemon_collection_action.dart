import 'package:flutter/cupertino.dart';
import 'package:movas/movas.dart';
import 'package:pokedex/movas/services/pokemon_collection/base_pokemon_collection_service.dart';

class PokemonCollectionAction {
  final BasePokemonCollectionService pokemonCollectionService;

  PokemonCollectionAction(this.pokemonCollectionService);

  factory PokemonCollectionAction.of(BuildContext context) {
    return PokemonCollectionAction(StaticProvider.of(context));
  }

  Future<void> loadMetadata() async {
    await pokemonCollectionService.getColors();
    await pokemonCollectionService.getTypes();
    return;
  }

  Future<void> getAllPokemon({int? page}) async {
    return await pokemonCollectionService.getAllPokemons(page: page);
  }

  Future<void> getPokemonDetail(String name) async {
    return await pokemonCollectionService.getPokemonDetail(name);
  }
}