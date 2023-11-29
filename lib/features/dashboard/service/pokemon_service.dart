import 'package:dio/dio.dart';
import 'package:pokedex/features/dashboard/models/pokemon_model.dart';

class PokemonService {
  Future<dynamic> getPokemons() async {
    final response =
        await Dio().get('https://pokeapi.co/api/v2/pokemon/?limit=15');

    return response.data;
  }

  Future<Pokemon> getOnePokemon(String url) async {
    final response = await Dio().get(url);

    return Pokemon.fromJson(response.data);
  }
}
