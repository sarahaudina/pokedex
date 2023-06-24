import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/movas/observables/pokemon_o.dart';
import 'package:pokedex/riverpod/repositories/pokemon/pokemon_repository.dart';

final currentOffsetProvider = StateProvider<int>((ref) => 1);

class PokemonController extends StateNotifier<AsyncValue<List<PokemonO>>> {
  final PokemonRepository pokemonRepository;
  final Ref ref;

  PokemonController(super.state, this.pokemonRepository, this.ref);


  Future<void> getPokemons() async {
    state = const AsyncLoading();

    /// AsyncValue.guard() automatically catches all exceptions
    state = await AsyncValue.guard(() async {
      /// Fetch
      final movieData = await pokemonRepository.getPokemons(
        offset: ref.read(currentOffsetProvider),
      );

      return movieData;
    });
  }
}
