// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex/features/dashboard/cubit/dashboard_cubit.dart';
import 'package:pokedex/features/dashboard/models/pokemon_model.dart';
import 'package:pokedex/features/pokemon_profile/widgets/header/header_profile_pokemon.dart';
import 'package:pokedex/utils/responsive/responsive.dart';

class BannerProfile extends StatelessWidget {
  const BannerProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final pokemon = ModalRoute.of(context)!.settings.arguments as Pokemon;
    final cubit = context.read<DashboardCubit>();

    final bool isLast = cubit.state.pokemonsList.last.id == pokemon.id;
    final bool isFirst = cubit.state.pokemonsList.first.id == pokemon.id;

    return Container(
      height: 35.h(context),
      width: 100.w(context),
      decoration: BoxDecoration(color: pokemon.getPokemonPrimaryColor()),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          const HeaderProfilePokemon(),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: 3.w(context), vertical: 3.w(context)),
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset(
              'assets/icons/pokeball.svg',
              color: Colors.white.withOpacity(0.2),
              width: 60.w(context),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: 1.h(context), horizontal: 5.w(context)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                  visible: !isFirst,
                  child: GestureDetector(
                    onTap: () => cubit.navigateBetweenPokemons(
                        currentPokemonId: pokemon.id,
                        context: context,
                        isNext: false),
                    child: SvgPicture.asset(
                      'assets/icons/arrow-left-min.svg',
                      width: 6.w(context),
                    ),
                  ),
                ),
                Visibility(
                  visible: !isLast,
                  child: GestureDetector(
                    onTap: () => cubit.navigateBetweenPokemons(
                        currentPokemonId: pokemon.id,
                        context: context,
                        isNext: true),
                    child: SvgPicture.asset(
                      'assets/icons/arrow-right-min.svg',
                      width: 6.w(context),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
