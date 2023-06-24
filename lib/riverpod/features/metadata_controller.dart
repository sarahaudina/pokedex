import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/movas/observables/pokemon_o.dart';
import 'package:pokedex/riverpod/models/metadata.dart';
import 'package:pokedex/riverpod/repositories/metadata/metadata_repository.dart';
import 'package:pokedex/riverpod/repositories/pokemon/pokemon_repository.dart';

final currentOffsetProvider = StateProvider<int>((ref) => 1);

class MetadataController extends StateNotifier<AsyncValue<MetadataO>> {
  final MetadataRepository metadataRepository;
  final Ref ref;

  MetadataController(super.state, this.metadataRepository, this.ref);

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
