import 'package:flutter/material.dart';
import 'package:pokedex/features/dashboard/models/pokemon_model.dart';
import 'package:pokedex/utils/formatter/formatter_utils.dart';
import 'package:pokedex/utils/pokemon/pokemon_utils.dart';
import 'package:pokedex/utils/responsive/responsive.dart';
import 'package:pokedex/utils/routes/routes_enum.dart';
import 'package:pokedex/utils/theme/theme.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PokemonItem extends StatelessWidget {
  const PokemonItem({super.key, required this.pokemon});
  final Pokemon pokemon;

  void onTapPokemon(BuildContext context) {
    Navigator.pushNamed(context, RoutesList.pokemonProfile, arguments: pokemon);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTapPokemon(context),
      child: Container(
          width: 20.w(context),
          height: 20.w(context),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(
                    color: Color.fromARGB(255, 210, 210, 210),
                    spreadRadius: 1,
                    blurRadius: 5)
              ]),
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Container(
                height: 12.w(context),
                decoration: BoxDecoration(
                    color: const Color(0xffEFEFEF),
                    borderRadius: BorderRadius.circular(15)),
              ),
              Positioned(
                top: 1.w(context),
                right: 2.w(context),
                child: Text(
                  formatID(pokemon.id),
                ),
              ),
              Positioned(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.network(
                      pokemon.picture,
                      width: 20.w(context),
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Container(
                          margin: EdgeInsets.only(bottom: 2.h(context)),
                          child: CircularProgressIndicator(
                            color: colorPmy(context),
                          ),
                        );
                      },
                    ),
                    Container(
                        margin: EdgeInsets.only(
                            top: 0.2.h(context), bottom: 0.4.h(context)),
                        child: Text(
                          pokemon.name.capitalize(),
                          style: TextStyle(fontSize: 14.sp),
                        )),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
