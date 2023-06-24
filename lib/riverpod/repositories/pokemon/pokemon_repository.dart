import 'package:pokedex/riverpod/observables/pokemon_detailed_o.dart';
import 'package:pokedex/riverpod/observables/pokemon_o.dart';

abstract class PokemonRepository {
  Future<List<PokemonO>> getPokemons({int? offset});
  Future<PokemonDetailsO> getPokemon(String name);
}