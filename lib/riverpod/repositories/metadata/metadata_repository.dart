import 'package:pokedex/riverpod/observables/pokemon_colors_o.dart';
import 'package:pokedex/riverpod/observables/pokemon_types_o.dart';
import 'package:pokedex/riverpod/models/metadata.dart';

abstract class MetadataRepository {
  Future<PokemonColorsO> getColors();
  Future<PokemonTypesO> getTypes();
  Future<MetadataO?> getMetadata();
}