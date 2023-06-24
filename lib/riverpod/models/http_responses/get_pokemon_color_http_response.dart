class GetPokemonColorHttpResponse {
  final Map<String, String> mapOfColors;
  final String color;

  GetPokemonColorHttpResponse(this.mapOfColors, this.color);

  factory GetPokemonColorHttpResponse.fromMap(Map<dynamic, dynamic> map) {
    final String color = map['name'];
    final List<dynamic> allPokemons = map['pokemon_species'];
    Map<String, String> result = {};
    for (var i in allPokemons) {
      result[i['name']] = color;
    }

    return GetPokemonColorHttpResponse(result, color);
  }
}