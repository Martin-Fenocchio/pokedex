import 'package:dio/dio.dart';
import 'package:pokedex/features/dashboard/models/pokemon_model.dart';
import 'package:pokedex/utils/pokemon/pokemon_utils.dart';

class PokemonService {
  Future<dynamic> getPokemonsNames() async {
    final response =
        await Dio().get('https://pokeapi.co/api/v2/pokemon?limit=200');

    return response.data;
  }

  Future<Pokemon> getOnePokemon(String url) async {
    final responses = await Future.wait([
      Dio().get(url),
      Dio()
          .get("https://pokeapi.co/api/v2/pokemon-species/${getIdFromUrl(url)}")
    ]);

    return Pokemon.fromJson({
      ...responses[0].data,
      'description': responses[1].data['flavor_text_entries'][0]['flavor_text']
    });
  }
}
