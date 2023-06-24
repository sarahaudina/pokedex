import 'package:pokedex/riverpod/observables/pokemon_colors_o.dart';
import 'package:pokedex/riverpod/observables/pokemon_types_o.dart';

class MetadataO {
  final PokemonColorsO colorsO;
  final PokemonTypesO typesO;

  MetadataO(this.colorsO, this.typesO);
}