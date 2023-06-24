import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/riverpod/observables/pokemon_detailed_o.dart';
import 'package:pokedex/riverpod/observables/pokemon_o.dart';
import 'package:pokedex/riverpod/repositories/pokemon/pokemon_repository.dart';

final currentOffsetProvider = StateProvider<int>((ref) => 1);

class PokemonDetailController extends StateNotifier<AsyncValue<PokemonDetailsO>> {
  final Ref ref;
  final PokemonRepository pokemonRepository;

  PokemonDetailController(this.ref, this.pokemonRepository) : super(const AsyncLoading());

  Future<void> getPokemon(String name) async {
    state = const AsyncLoading();

    /// AsyncValue.guard() automatically catches all exceptions
    state = await AsyncValue.guard(() async {
      final movieData = await pokemonRepository.getPokemon(
        name
      );

      return movieData;
    });
  }
}
