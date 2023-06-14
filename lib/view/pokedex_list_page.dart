import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/movas/actions/pokemon_collection_action.dart';
import 'package:pokedex/movas/observables/all_pokemons_o.dart';
import 'package:pokedex/movas/util.dart';
import 'package:pokedex/view/pokedex_details_page.dart';
import 'package:provider/provider.dart';

class PokeDexPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PokemonCollectionAction.of(context).loadMetadata().then((value) =>
        PokemonCollectionAction.of(context).getAllPokemon()
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Pokedex", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 30),),
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: false,
      ),
      body: Consumer<AllPokemonO>(builder: (BuildContext context, value, Widget? child) {
        return value.allPokemons.isEmpty
            ? Center(
          child: CircularProgressIndicator(),
        ) : GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              childAspectRatio: .8
            ),
            padding: EdgeInsets.all(16),
            itemCount: value.allPokemons.length,
            itemBuilder: (_, index){
                    return InkWell(
                      onTap: () {
                        PokemonCollectionAction.of(context).getPokemonDetail(value.allPokemons[index].name);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => PokedexDetailsPage(pokemonO: value.allPokemons[index],),
                        ));
                      },
                      child: SizedBox(
                        child: Container(
                          decoration: BoxDecoration(
                            color: getColor(value.allPokemons[index].color),
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                          ),
                          padding: EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Image.network('https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${value.allPokemons[index].id}.png'),
                              Text(capitalize(value.allPokemons[index].name), style: TextStyle(fontWeight: FontWeight.bold, color: getContrastColor(getColor(value.allPokemons[index].color)), fontSize: 18),),
                              ...value.allPokemons[index].types!.map((type)
                              => Padding(padding: EdgeInsets.only(top: 8), child: typeBadge(type, getColor(value.allPokemons[index].color))))
                            ],
                          ),
                        ),
                      )
                    );
            });
      }),
    );
  }
}

Widget typeBadge(String type, Color mainColor) {
  return Container(
    margin: EdgeInsets.only(right: 8),
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(.3),
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
    child: Column(
      children: [
        Text(type, style: TextStyle(color: getContrastColor(mainColor)),)
      ],
    ),
  );
}
