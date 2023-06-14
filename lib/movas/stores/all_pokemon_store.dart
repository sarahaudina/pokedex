import 'package:movas/movas.dart';
import 'package:pokedex/movas/models/http_responses/get_pokemon_color_http_response.dart';
import 'package:pokedex/movas/models/http_responses/get_pokemon_type_http_response.dart';
import 'package:pokedex/movas/models/http_responses/get_pokemons_http_response.dart';
import 'package:pokedex/movas/observables/all_pokemons_o.dart';
import 'package:pokedex/movas/observables/pokemon_colors_o.dart';
import 'package:pokedex/movas/observables/pokemon_o.dart';
import 'package:pokedex/movas/observables/pokemon_types_o.dart';

class AllPokemonStore extends Store3<AllPokemonO, PokemonColorsO, PokemonTypesO> {
  final PublishSubject<GetPokemonsHttpResponse> getPokemons$;
  final PublishSubject<GetPokemonColorHttpResponse> getPokemonColors$;
  final PublishSubject<GetPokemonTypeHttpResponse> getPokemonType$;

  PokemonColorsO? get currentColorMap => o$[PokemonColorsO]?.valueOrNull;

  PokemonTypesO? get currentTypesMap => o$[PokemonTypesO]?.valueOrNull;

  AllPokemonStore(this.getPokemons$, this.getPokemonColors$, this.getPokemonType$) {
    listen(getPokemons$, (p1)  {
      List<PokemonO> newPokemons = [];
      for (var i in p1.pokemons) {
        var color = currentColorMap?.mapOfColors[i.name];
        var types = currentTypesMap?.mapOfTypes[i.name];

        print('${i.id} poke ${i.name} is $color $types');

        newPokemons.add(PokemonO(i.id, i.url, i.name, color ?? "", types ?? []));
      }

      print('poke count is ${newPokemons.length}');

      add(AllPokemonO(newPokemons));
    });

    listen(getPokemonColors$, (p1)  {
      if (currentColorMap?.colors.contains(p1.color) ?? false) {
        return;
      } else {
        if (currentColorMap==null) {
          add(PokemonColorsO(
              colors: [p1.color],
              mapOfColors: p1.mapOfColors
          ));
        } else {
          add(currentColorMap!.copyWith(
              colors: currentColorMap!.colors..add(p1.color),
              mapOfColors: currentColorMap!.mapOfColors..addAll(p1.mapOfColors)
          ));
        }
      }
    });

    listen(getPokemonType$, (p1)  {
      if (currentTypesMap?.types.contains(p1.type) ?? false) {
        return;
      } else {
        Map<String, List<String>> updatedMapOfTypes = currentTypesMap?.mapOfTypes ?? {};
        for (String pokemon in p1.pokemons) {
          if (updatedMapOfTypes[pokemon]!=null) {
            updatedMapOfTypes[pokemon] = updatedMapOfTypes[pokemon]!..add(p1.type);
          } else {
            updatedMapOfTypes[pokemon] = [p1.type];
          }
        }

        if (currentTypesMap==null) {
          add(PokemonTypesO(
              types: [p1.type],
              mapOfTypes: updatedMapOfTypes
          ));

        } else {
          add(currentTypesMap!.copyWith(
              types: currentTypesMap!.types..add(p1.type),
              mapOfTypes: updatedMapOfTypes
          ));
        }
      }
    });
  }
}

