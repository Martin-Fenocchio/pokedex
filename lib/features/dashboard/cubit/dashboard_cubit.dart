// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/features/dashboard/models/pokemon_model.dart';
import 'package:pokedex/features/dashboard/service/pokemon_service.dart';
import 'package:pokedex/utils/routes/routes_enum.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(const DashboardState.init());

  TextEditingController searchController = TextEditingController();

  void setIsLoading(bool isLoading) {
    emit(state.copyWith(isLoading: isLoading));
  }

  Future<void> getListOfAllPokemones({String? sortby}) async {
    setIsLoading(true);

    final response = await PokemonService().getPokemons();

    emit(state.copyWith(allPokemonsNames: response['results']));

    try {
      await getPokemons(response['results'].sublist(0, 18));
    } catch (e) {
      //
    }
  }

  Future<void> getPokemons(List pokemons, {int? limit}) async {
    final List<Pokemon> pokemonsList = [...state.pokemonsList];

    for (final pokemon in pokemons) {
      PokemonService().getOnePokemon(pokemon['url']).then((value) {
        if (state.pokemonsList.any((element) => element.id == value.id) ==
            false) {
          pokemonsList.add(value);
        }

        if (pokemonsList.length == (limit ?? pokemons.length)) {
          emit(state.copyWith(pokemonsList: pokemonsList));
          setIsLoading(false);
        }
      });
    }
  }

  void sortBy(String sortBy, {int? limit}) {
    emit(state.copyWith(sortBy: sortBy));

    if (searchController.text.isEmpty) {
      final allPokemonsNames = [...state.allPokemonsNames];

      if (sortBy == 'Name') {
        allPokemonsNames
            .sort((a, b) => (a['name']!.compareTo(b['name']!) as int));
      }

      final int length = state.pokemonsList.length;

      emit(state.copyWith(pokemonsList: [], isLoading: true));

      getPokemons(
          allPokemonsNames.sublist(
            0,
            limit ?? length,
          ),
          limit: limit ?? length);
    }
  }

  void getMorePokemons() async {
    final length = state.pokemonsList.length;

    await getPokemons(state.allPokemonsNames.sublist(length - 1, length + 8),
        limit: length + 8);
  }

  void onSearch() {
    final String text = searchController.text;

    if (text.isEmpty) {
      sortBy(state.sortBy, limit: 18);
      return;
    }

    final List pokemonsMatched = state.allPokemonsNames
        .where((pokemon) =>
            pokemon['name'].toLowerCase().contains(text.toLowerCase().trim()))
        .toList();

    if (pokemonsMatched.isEmpty) {
      emit(state.copyWith(pokemonsList: []));
      return;
    }

    emit(state.copyWith(pokemonsList: [], isLoading: true));

    final matchesAreTooLong = pokemonsMatched.length > 30;

    getPokemons(
        matchesAreTooLong ? pokemonsMatched.sublist(0, 30) : pokemonsMatched,
        limit: matchesAreTooLong ? 30 : pokemonsMatched.length);
  }

  void navigateBetweenPokemons(
      {required int currentPokemonId,
      required BuildContext context,
      required bool isNext}) {
    final pokemons = state.pokemonsList;
    final int index =
        pokemons.indexWhere((pokemon) => pokemon.id == currentPokemonId);

    for (int i = 0; i < pokemons.length; i++) {
      if (i == index + (isNext ? 1 : -1)) {
        Navigator.pushNamed(context, RoutesList.pokemonProfile,
            arguments: pokemons[i]);
        break;
      }
    }
  }
}
