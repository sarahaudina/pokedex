class GetPokemonTypeHttpResponse {
  final List<String> pokemons;
  final String type;

  GetPokemonTypeHttpResponse(this.pokemons, this.type);

  factory GetPokemonTypeHttpResponse.fromMap(Map<dynamic, dynamic> map) {
    final String type = map['name'];
    final List<String> pokemons = [];
    for (Map i in map['pokemon']) {
      pokemons.add(i['pokemon']['name']);
    }
    
    return GetPokemonTypeHttpResponse(pokemons, type);
  }
}