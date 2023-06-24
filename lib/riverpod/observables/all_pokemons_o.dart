import 'package:pokedex/riverpod/observables/pokemon_o.dart';

class AllPokemonO {
  final List<PokemonO> allPokemons;

  AllPokemonO(this.allPokemons);

  AllPokemonO copyWith({
    List<PokemonO>? allPokemons,
  }) {
    return AllPokemonO(
       allPokemons ?? this.allPokemons,
    );
  }
}