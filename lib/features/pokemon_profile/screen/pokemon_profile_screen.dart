import 'package:flutter/material.dart';
import 'package:pokedex/features/dashboard/models/pokemon_model.dart';
import 'package:pokedex/features/pokemon_profile/widgets/banner/banner_profile.dart';
import 'package:pokedex/features/pokemon_profile/widgets/pokemon_stats/pokemon_stats.dart';
import 'package:pokedex/utils/responsive/responsive.dart';

class PokemonProfileScreen extends StatelessWidget {
  const PokemonProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pokemon = ModalRoute.of(context)!.settings.arguments as Pokemon;

    return Scaffold(
      backgroundColor: pokemon.getPokemonPrimaryColor(),
      body: Stack(
        children: [
          const Column(
            children: [
              BannerProfile(),
              PokemonStats(),
            ],
          ),
          Positioned(
              left: 12.5.w(context),
              top: 15.h(context),
              child: Image.network(
                pokemon.picture,
                width: 75.w(context),
              )),
        ],
      ),
    );
  }
}
