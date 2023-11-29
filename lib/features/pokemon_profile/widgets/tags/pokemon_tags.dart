import 'package:flutter/material.dart';
import 'package:pokedex/features/dashboard/models/pokemon_model.dart';
import 'package:pokedex/utils/formatter/formatter_utils.dart';
import 'package:pokedex/utils/pokemon/pokemon_utils.dart';
import 'package:pokedex/utils/responsive/responsive.dart';

class PokemonTags extends StatelessWidget {
  const PokemonTags({super.key});

  @override
  Widget build(BuildContext context) {
    final pokemon = ModalRoute.of(context)!.settings.arguments as Pokemon;

    return Container(
      margin: EdgeInsets.only(bottom: 3.h(context)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [for (String tag in pokemon.tags) tagItem(tag)],
      ),
    );
  }

  Widget tagItem(String tag) {
    return Builder(builder: (context) {
      return Container(
          margin: EdgeInsets.symmetric(horizontal: 2.w(context)),
          padding: EdgeInsets.symmetric(
              horizontal: 2.w(context), vertical: 0.5.h(context)),
          decoration: BoxDecoration(
              color: getTagColor(tag), borderRadius: BorderRadius.circular(5)),
          child: Text(
            tag.capitalize(),
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ));
    });
  }
}
