import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/features/dashboard/cubit/dashboard_cubit.dart';
import 'package:pokedex/features/dashboard/widgets/pokemon_item/pokemon_item.dart';
import 'package:pokedex/features/dashboard/widgets/pokemon_item/pokemon_item_skeleton.dart';
import 'package:pokedex/utils/responsive/responsive.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({super.key});

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.addListener(detectScroll);
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void detectScroll() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      context.read<DashboardCubit>().getMorePokemons();
    }
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<DashboardCubit>();

    final pokemons = cubit.state.pokemonsList;

    if (pokemons.isNotEmpty) {
      if (cubit.state.sortBy == 'Name') {
        pokemons.sort((a, b) => a.name.compareTo(b.name));
      } else {
        pokemons.sort((a, b) => a.id.compareTo(b.id));
      }
    }

    return Container(
      height: 79.h(context),
      margin: EdgeInsets.all(2.w(context)).copyWith(bottom: 0),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: GridView(
        controller: scrollController,
        padding: EdgeInsets.symmetric(
            vertical: 3.h(context), horizontal: 3.w(context)),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 20.w(context) / 22.w(context),
            mainAxisSpacing: 3.w(context),
            crossAxisSpacing: 2.w(context)),
        children: [
          if (cubit.state.isLoading)
            for (final _ in List.generate(18, (index) => index))
              const PokemonItemSkeleton()
          else
            for (final pokemon in pokemons) PokemonItem(pokemon: pokemon),
        ],
      ),
    );
  }
}
