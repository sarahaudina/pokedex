import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/movas/observables/pokemon_detailed_o.dart';
import 'package:pokedex/movas/observables/pokemon_o.dart';
import 'package:pokedex/movas/util.dart';
import 'package:pokedex/view/pokedex_list_page.dart';
import 'package:provider/provider.dart';

class PokedexDetailsPage extends StatelessWidget {
  final PokemonO pokemonO;

  const PokedexDetailsPage({super.key, required this.pokemonO});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: getColor(pokemonO.color),
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: EdgeInsets.only(left: 20),
          child: IconButton(
            icon: Icon(Icons.arrow_back),
        onPressed: () {
              Navigator.of(context).pop();
        },
      ),
        ),
      ),
      body: Consumer<PokemonDetailsO>(builder: (BuildContext context, value, Widget? child) {
        return
          value?.name!= pokemonO.name
              ? Center(
                child: CircularProgressIndicator(),
              ) : Center(
        child: PokemonDescriptionModal(details: value, pokemonO: pokemonO,),);
      },),
    );
  }
}

class PokemonDescriptionModal extends StatefulWidget {
  final PokemonDetailsO details;
  final PokemonO pokemonO;

  const PokemonDescriptionModal({super.key, required this.details, required this.pokemonO});

  @override
  _PokemonDescriptionModalState createState() => _PokemonDescriptionModalState();
}

class _PokemonDescriptionModalState extends State<PokemonDescriptionModal> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
      height: constraints.maxHeight,
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            color: getColor(widget.pokemonO.color),
          ),
          Container(
            height: 150,
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("${capitalize(widget.details.name)}", style: TextStyle(
                      fontSize: 32,
                      color: getContrastColor(getColor(widget.pokemonO.color)),
                      fontWeight: FontWeight.bold
                    ),),
                    Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Row(
                        children: [
                          ...widget.pokemonO.types.map((el) => typeBadge(el, getColor(widget.pokemonO.color)))
                        ],
                      ),
                    )
                  ],
                ),
                Text("# ${widget.details.id}", style: TextStyle(
                    color: getContrastColor(getColor(widget.pokemonO.color)),
                  fontSize: 24,
                  fontWeight: FontWeight.bold
                ),)
              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 200),
          child: Container(
            child: Column(
              children: [
                TabBar(
                  controller: _tabController,
                  labelColor: Colors.black,
                  automaticIndicatorColorAdjustment: true,
                  tabs: [
                    Tab(text: 'About'),
                    Tab(text: 'Base Stats'),
                    Tab(text: 'Moves'),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      AboutWidget(widget.details),
                      BaseStatsWidget(details: widget.details,),
                      MovesWidget(details: widget.details),
                    ],
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topRight: Radius.circular(32), topLeft: Radius.circular(32))
            ),
          ),),
          Positioned(
              left: 100,
              right: 100,
              top: 200-130,
              child: Image.network(
                  "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${widget.details.id}.png",
                width: 700,
                fit: BoxFit.fitWidth,
              ))
        ],
      )
    );}
    );
  }
}

class AboutWidget extends StatelessWidget {
  final PokemonDetailsO details;

  AboutWidget(this.details);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Species"),
              Container(height: 8,),
              Text("Height"),
              Container(height: 8,),
              Text("Weight"),
              Container(height: 8,),
              Text("Abilities")
            ],
          ),
          Padding(
              padding: EdgeInsets.only(left: 32),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(capitalize(details.species)),
                Container(height: 8,),
                Text(details.height.toString()),
                Container(height: 8,),
                Text(details.weight.toString()),
                Container(height: 8,),
                Text(details.abilities.join(", "))
              ]
          )
              ,
          )
        ],
      ),
    );
  }
}

class BaseStatsWidget extends StatelessWidget {
  final PokemonDetailsO details;

  const BaseStatsWidget({super.key, required this.details});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("HP"),
              Container(height: 8,),
              Text("Attack"),
              Container(height: 8,),
              Text("Defense"),
              Container(height: 8,),
              Text("Sp. Atk"),
              Container(height: 8,),
              Text("Sp. Def"),
              Container(height: 8,),
              Text("Speed")
            ],
          ),
          Container(width: 32,),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(details.stats.hp.toString()),
                Container(height: 8,),
                Text(details.stats.attack.toString()),
                Container(height: 8,),
                Text(details.stats.defense.toString()),
                Container(height: 8,),
                Text(details.stats.spAttack.toString()),
                Container(height: 8,),
                Text(details.stats.spDefense.toString()),
                Container(height: 8,),
                Text(details.stats.speed.toString())
              ]
          ),
        ],
      ),
    );
  }
}


class MovesWidget extends StatelessWidget {
  final PokemonDetailsO details;

  const MovesWidget({super.key, required this.details});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(32),
      color: Colors.white,
      child: ListView(
        padding: null,
        children: [
          ...details.moves.map((el) => buildMove(el, context))
        ],
      ),
    );
  }

  Widget buildMove(Move move, BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 16
      ),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        boxShadow:     [BoxShadow(
          offset: Offset(3, 3),
          spreadRadius: -3,
          blurRadius: 5,
          color: Color.fromRGBO(255, 255, 255, 1),
        )],
        border: Border.all(color: Colors.black, width: .1)
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(capitalize(move.name), style: TextStyle(fontWeight: FontWeight.bold),),
          ...move.versionGroupDetails.map((el) => buildVersionGroupDetail(el, context))
        ],
      ),
    );
  }

  Widget buildVersionGroupDetail(VersionGroupDetail vgDetail, BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 8),
        width: MediaQuery.of(context).size.width,
        child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Level learned at: "),
              Text("Move learn method "),
              Text("Version group ")
            ],
          ),
          Container(width: 8,),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${vgDetail.levelLearnedAt}"),
              Text("${vgDetail.moveLearnMethod}"),
              Container(
                  child: Text("${vgDetail.versionGroup}", overflow: TextOverflow.ellipsis, maxLines: 3,)
              )
            ],
          ))
        ],
      )
    );
  }
}

