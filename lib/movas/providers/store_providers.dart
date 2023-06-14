import 'package:movas/movas.dart';
import 'package:pokedex/movas/observables/all_pokemons_o.dart';
import 'package:pokedex/movas/observables/pokemon_colors_o.dart';
import 'package:pokedex/movas/observables/pokemon_detailed_o.dart';
import 'package:pokedex/movas/observables/pokemon_types_o.dart';
import 'package:pokedex/movas/stores/all_pokemon_store.dart';
import 'package:pokedex/movas/stores/pokemon_detail_store.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> storeProviders = [
  MyStoreProvider3(
      initialData: AllPokemonO([]),
      initialData2: PokemonColorsO(mapOfColors: {}, colors: []),
      initialData3: PokemonTypesO(mapOfTypes: {}, types: []),
      storeBuilder: (context) => AllPokemonStore(
          StaticProvider.of(context),
          StaticProvider.of(context),
          StaticProvider.of(context)
      )),
  StoreProvider<PokemonDetailStore, PokemonDetailsO>(
    storeBuilder: (context) => PokemonDetailStore(
      StaticProvider.of(context),
    ),
  ),
];