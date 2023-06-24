import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/riverpod/observables/pokemon_o.dart';
import 'package:pokedex/riverpod/repositories/pokemon/pokemon_repository.dart';

final currentOffsetProvider = StateProvider<int>((ref) => 1);

class PokemonController extends StateNotifier<AsyncValue<List<PokemonO>>> {
  final Ref ref;
  final PokemonRepository pokemonRepository;

  PokemonController(this.ref, this.pokemonRepository) : super(const AsyncLoading());

  Future<void> getPokemons() async {
    state = const AsyncLoading();

    /// AsyncValue.guard() automatically catches all exceptions
    state = await AsyncValue.guard(() async {
      final movieData = await pokemonRepository.getPokemons(
        offset: ref.read(currentOffsetProvider),
      );

      return movieData;
    });
  }
}
