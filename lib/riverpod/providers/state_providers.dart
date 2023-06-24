import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/riverpod/observables/pokemon_detailed_o.dart';
import 'package:pokedex/riverpod/observables/pokemon_o.dart';
import 'package:pokedex/riverpod/features/metadata_controller.dart';
import 'package:pokedex/riverpod/features/pokemon_controller.dart';
import 'package:pokedex/riverpod/features/pokemon_detail_controller.dart';
import 'package:pokedex/riverpod/models/metadata.dart';
import 'package:pokedex/riverpod/providers/repositories_provider.dart';

final metadataProvider = StateNotifierProvider<MetadataController, AsyncValue<MetadataO>>((ref) {
  final metadataRepository = ref.read(metadataRepositoryProvider);

  return MetadataController(metadataRepository);
});

final pokemonsProvider = StateNotifierProvider<PokemonController, AsyncValue<List<PokemonO>>>((ref) {
  final pokemonRepository = ref.read(pokemonRepositoryProvider);

  return PokemonController(ref, pokemonRepository);
});

final pokemonDetailProvider = StateNotifierProvider<PokemonDetailController, AsyncValue<PokemonDetailsO>>((ref) {
  final pokemonRepository = ref.read(pokemonRepositoryProvider);

  return PokemonDetailController(ref, pokemonRepository);
});