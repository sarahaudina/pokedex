abstract class BasePokemonCollectionService {
  Future<void> getColors();
  Future<void> getTypes();
  Future<void> getAllPokemons({int? page});
  Future<void> getPokemonDetail(String name);
}