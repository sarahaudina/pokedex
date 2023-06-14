abstract class BasePokemonCollectionService {
  Future<void> getColors();
  Future<void> getTypes();
  Future<void> getAllPokemons({int? offset});
  Future<void> getPokemonDetail(String name);
}