import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/riverpod/providers/services_provider.dart';
import 'package:pokedex/riverpod/repositories/metadata/http_metadata_repository.dart';
import 'package:pokedex/riverpod/repositories/metadata/metadata_repository.dart';
import 'package:pokedex/riverpod/repositories/pokemon/http_pokemon_repository.dart';
import 'package:pokedex/riverpod/repositories/pokemon/pokemon_repository.dart';

final metadataRepositoryProvider = Provider<MetadataRepository>(
      (ref) => HttpMetadataRepository(ref.read(dioServiceProvider))
);

final pokemonRepositoryProvider = Provider<PokemonRepository>(
        (ref) => HttpPokemonRepository(ref.read(dioServiceProvider))
);