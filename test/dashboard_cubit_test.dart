import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/features/dashboard/cubit/dashboard_cubit.dart';
import 'package:pokedex/features/dashboard/service/pokemon_service.dart';

void main() {
  test('Get pokemons names', () async {
    final cubit = DashboardCubit(service: PokemonService());

    final response = await cubit.getListOfAllPokemonNames();

    expect(response.length, 200);
  });

  test('Get full data of pokemons', () async {
    final cubit = DashboardCubit(service: PokemonService());

    final namesResponse = await cubit.getListOfAllPokemonNames();

    final pokemonsWithAllDataResponse =
        await cubit.getFullDataOfPokemons(namesResponse.sublist(0, 18));

    expect(pokemonsWithAllDataResponse?.length, 18);
  });

  test('Sorting pokemons by name', () async {
    final cubit = DashboardCubit(service: PokemonService());

    await cubit.handleGetAllDataOfPokemons();

    await cubit.sortBy('Name');

    expect(() {
      final pokemonList = cubit.state.pokemonsList;

      return [
        pokemonList[0].name == 'abra',
        pokemonList[1].name == 'aerodactyl',
        pokemonList[2].name == 'aipom',
      ].every((e) => e == true);
    }(), true);
  });

  test('Get more pokemons', () async {
    final cubit = DashboardCubit(service: PokemonService());

    await cubit.handleGetAllDataOfPokemons();
    await cubit.getMorePokemons();
    await cubit.getMorePokemons();

    expect(cubit.state.pokemonsList.length, 34);
  });

  test('Search by name', () async {
    final cubit = DashboardCubit(service: PokemonService());

    await cubit.handleGetAllDataOfPokemons();

    cubit.searchController.text = 'bel';

    await cubit.onSearch();

    expect(cubit.state.pokemonsList.length, 4);
  });
}
