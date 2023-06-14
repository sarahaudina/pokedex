import 'package:movas/movas.dart';
import 'package:movas/provider/provider.dart';
import 'package:pokedex/movas/models/http_responses/get_pokemon_details_http_response.dart';
import 'package:pokedex/movas/observables/pokemon_detailed_o.dart';

class PokemonDetailStore extends Store<PokemonDetailsO> {
  final PublishSubject<GetPokemonDetailsHttpResponse> getPokemonDetails$;

  PokemonDetailStore(this.getPokemonDetails$) {
    listen(getPokemonDetails$, (p1)  {
      add(PokemonDetailsO.fromEntity(p1));
    });
  }
}