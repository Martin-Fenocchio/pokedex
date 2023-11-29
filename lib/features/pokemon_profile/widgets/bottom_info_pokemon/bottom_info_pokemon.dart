import 'package:flutter/material.dart';
import 'package:pokedex/features/dashboard/models/pokemon_model.dart';
import 'package:pokedex/features/pokemon_profile/widgets/bottom_info_pokemon/pokemon_base_stat_item.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BottomInfoPokemon extends StatelessWidget {
  const BottomInfoPokemon({super.key});

  @override
  Widget build(BuildContext context) {
    final pokemon = ModalRoute.of(context)!.settings.arguments as Pokemon;

    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 4.h, bottom: 2.h),
          child: Text(
            'Base Stats',
            style: TextStyle(
                color: pokemon.getPokemonPrimaryColor(),
                fontWeight: FontWeight.bold,
                fontSize: 18.sp),
          ),
        ),
        for (final stat in pokemon.stats)
          PokemonBaseStatItem(
              stat: stat, color: pokemon.getPokemonPrimaryColor()),
        SizedBox(
          height: 10.h,
        )
      ],
    );
  }
}
