import 'package:flutter/material.dart';
import 'package:pokedex/features/dashboard/models/pokemon_model.dart';
import 'package:pokedex/features/pokemon_profile/widgets/bottom_info_pokemon/bottom_info_pokemon.dart';
import 'package:pokedex/features/pokemon_profile/widgets/tags/pokemon_tags.dart';
import 'package:pokedex/features/pokemon_profile/widgets/top_info_pokemon/top_info_pokemon.dart';
import 'package:pokedex/utils/responsive/responsive.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PokemonStats extends StatelessWidget {
  const PokemonStats({super.key});

  @override
  Widget build(BuildContext context) {
    final pokemon = ModalRoute.of(context)!.settings.arguments as Pokemon;

    return Container(
      height: 65.h(context),
      width: 96.w(context),
      margin: EdgeInsets.only(left: 2.w(context), right: 2.w(context)),
      padding: EdgeInsets.only(
          top: 15.h(context), left: 8.w(context), right: 8.w(context)),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PokemonTags(),
            Center(
              child: Text(
                'About',
                style: TextStyle(
                    color: pokemon.getPokemonPrimaryColor(),
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp),
              ),
            ),
            const TopInfoPokemon(),
            Text(pokemon.description, style: const TextStyle()),
            const BottomInfoPokemon(),
          ],
        ),
      ),
    );
  }
}
