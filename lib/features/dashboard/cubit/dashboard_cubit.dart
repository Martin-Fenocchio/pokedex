// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/features/dashboard/models/pokemon_model.dart';
import 'package:pokedex/features/dashboard/service/pokemon_service.dart';
import 'package:pokedex/utils/routes/routes_enum.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  final PokemonService service;

  DashboardCubit({required this.service}) : super(const DashboardState.init());

  TextEditingController searchController = TextEditingController();

  Future<List> getListOfAllPokemonNames() async {
    setIsLoading(true);

    try {
      final response = await service.getPokemonsNames();
      setIsLoading(false);

      return response['results'];
    } catch (e) {
      setIsLoading(false);
      return [];
    }
  }

  Future<List<Pokemon>?> getFullDataOfPokemons(List pokemons,
      {int? limit}) async {
    final completer = Completer<List<Pokemon>>();

    final List<Pokemon> pokemonsList = [...state.pokemonsList];

    for (final pokemon in pokemons) {
      service.getOnePokemon(pokemon['url']).then((value) {
        final bool isPokemonAlreadyInList =
            state.pokemonsList.any((element) => element.id == value.id);

        if (!isPokemonAlreadyInList) {
          pokemonsList.add(value);
        }

        if (pokemonsList.length == (limit ?? pokemons.length)) {
          setIsLoading(false);

          completer.complete(pokemonsList);
        }
      });
    }

    return completer.future;
  }

  Future<void> handleGetAllDataOfPokemons() async {
    final pokemonsNames = await getListOfAllPokemonNames();
    final fullDataOfPokemons =
        await getFullDataOfPokemons(pokemonsNames.sublist(0, 18));

    emit(state.copyWith(
        pokemonsList: fullDataOfPokemons, allPokemonsNames: pokemonsNames));
  }

  Future<void> sortBy(String sortBy, {int? limit}) async {
    emit(state.copyWith(sortBy: sortBy));

    if (searchController.text.isEmpty) {
      final allPokemonsNames = [...state.allPokemonsNames];

      final bool isSortByName = sortBy == 'Name';

      if (isSortByName) {
        allPokemonsNames
            .sort((a, b) => (a['name']!.compareTo(b['name']!) as int));
      }

      final int length = state.pokemonsList.length;
      final int limitOrLength = limit ?? length;

      emit(state.copyWith(pokemonsList: [], isLoading: true));

      final sortedPokemons = await getFullDataOfPokemons(
          allPokemonsNames.sublist(
            0,
            limitOrLength,
          ),
          limit: limitOrLength);

      if (isSortByName) {
        sortedPokemons?.sort((a, b) => a.name.compareTo(b.name));
      }

      emit(state.copyWith(pokemonsList: sortedPokemons));
    }
  }

  Future<void> getMorePokemons() async {
    final length = state.pokemonsList.length;

    final response = await getFullDataOfPokemons(
        state.allPokemonsNames.sublist(length - 1, length + 9),
        limit: length + 9);

    emit(state.copyWith(pokemonsList: response));
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

  Future<void> onSearch() async {
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

    final response = await getFullDataOfPokemons(
        matchesAreTooLong ? pokemonsMatched.sublist(0, 30) : pokemonsMatched,
        limit: matchesAreTooLong ? 30 : pokemonsMatched.length);

    emit(state.copyWith(pokemonsList: response));
  }

  void setIsLoading(bool isLoading) {
    emit(state.copyWith(isLoading: isLoading));
  }
}
