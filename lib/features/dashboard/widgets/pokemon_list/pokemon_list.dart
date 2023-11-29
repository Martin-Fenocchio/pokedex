import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/features/dashboard/cubit/dashboard_cubit.dart';
import 'package:pokedex/features/dashboard/widgets/pokemon_item/pokemon_item.dart';
import 'package:pokedex/utils/responsive/responsive.dart';

class PokemonList extends StatelessWidget {
  const PokemonList({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<DashboardCubit>();

    return Container(
      height: 79.h(context),
      margin: EdgeInsets.all(2.w(context)).copyWith(bottom: 0),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: GridView(
        padding: EdgeInsets.symmetric(
            vertical: 3.h(context), horizontal: 3.w(context)),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 20.w(context) / 22.w(context),
            mainAxisSpacing: 3.w(context),
            crossAxisSpacing: 2.w(context)),
        children: [
          for (final pokemon in cubit.state.pokemonsList)
            PokemonItem(pokemon: pokemon)
        ],
      ),
    );
  }
}
