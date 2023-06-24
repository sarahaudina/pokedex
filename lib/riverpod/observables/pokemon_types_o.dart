class PokemonTypesO {
  final Map<String, List<String>> mapOfTypes;
  final List<String> types;

  PokemonTypesO({required this.mapOfTypes, required this.types});

  PokemonTypesO copyWith({
    Map<String, List<String>>? mapOfTypes,
    List<String>? types,
  }) {
    return PokemonTypesO(
      mapOfTypes: mapOfTypes ?? this.mapOfTypes,
      types: types ?? this.types,
    );
  }
}