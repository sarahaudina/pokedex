import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/riverpod/observables/pokemon_o.dart';
import 'package:pokedex/riverpod/models/metadata.dart';
import 'package:pokedex/riverpod/providers/repositories_provider.dart';
import 'package:pokedex/riverpod/repositories/metadata/metadata_repository.dart';
import 'package:pokedex/riverpod/repositories/pokemon/pokemon_repository.dart';

class MetadataController extends StateNotifier<AsyncValue<MetadataO>> {
  final MetadataRepository metadataRepository;

  MetadataController(this.metadataRepository) : super(const AsyncLoading());

  Future<void> getMetadata() async {
    state = const AsyncLoading();

    /// AsyncValue.guard() automatically catches all exceptions
    state = await AsyncValue.guard(() async {
      /// Fetch
      final metadata = await metadataRepository.getMetadata();

      return metadata!;
    });
  }
}
