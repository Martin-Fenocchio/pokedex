import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:pokedex/features/dashboard/models/pokemon_model.dart';
import 'package:pokedex/features/dashboard/service/pokemon_service.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(const DashboardState.init());

  void setIsLoading(bool isLoading) {
    emit(state.copyWith(isLoading: isLoading));
  }

  Future<void> getPokemons() async {
    final List<Pokemon> pokemonsList = [];
    setIsLoading(true);

    try {
      final response = await PokemonService().getPokemons();

      for (final pokemon in response['results']) {
        pokemonsList.add(await PokemonService().getOnePokemon(pokemon['url']));
      }

      emit(state.copyWith(pokemonsList: pokemonsList));
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      setIsLoading(false);
    }
  }
}
