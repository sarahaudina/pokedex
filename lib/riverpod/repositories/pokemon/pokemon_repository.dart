import 'package:pokedex/movas/models/pokemon_model.dart';
import 'package:pokedex/movas/observables/pokemon_detailed_o.dart';
import 'package:pokedex/movas/observables/pokemon_o.dart';

abstract class PokemonRepository {
  Future<List<PokemonO>> getPokemons({int? offset});
  Future<PokemonDetailsO> getPokemon(String name);
}