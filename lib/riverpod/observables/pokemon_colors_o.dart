class PokemonColorsO {
  final Map<String, String> mapOfColors;
  final List<String> colors;

  PokemonColorsO({required this.mapOfColors, required this.colors});

  PokemonColorsO copyWith({
    Map<String, String>? mapOfColors,
    List<String>? colors
  }) {
    return PokemonColorsO(
      mapOfColors: mapOfColors ?? this.mapOfColors,
      colors: colors ?? this.colors
    );
  }
}


class Colors {
  static const String main = '/boot';
  static const String detail = '/login';
}