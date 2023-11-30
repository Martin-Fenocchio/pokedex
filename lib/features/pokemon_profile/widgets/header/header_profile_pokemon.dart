import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex/features/dashboard/models/pokemon_model.dart';
import 'package:pokedex/utils/formatter/formatter_utils.dart';
import 'package:pokedex/utils/pokemon/pokemon_utils.dart';
import 'package:pokedex/utils/responsive/responsive.dart';
import 'package:pokedex/utils/routes/routes_enum.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HeaderProfilePokemon extends StatelessWidget {
  const HeaderProfilePokemon({super.key});

  @override
  Widget build(BuildContext context) {
    final pokemon = ModalRoute.of(context)!.settings.arguments as Pokemon;

    return Positioned(
      top: 8.h(context),
      width: 100.w(context),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w(context)),
        child: Row(
          children: [
            GestureDetector(
                onTap: () => Navigator.pushNamed(context, RoutesList.dashboard),
                child: SvgPicture.asset('assets/icons/arrow-left.svg')),
            SizedBox(
              width: 2.w(context),
            ),
            Text(
              pokemon.name.capitalize(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Text(
              formatID(pokemon.id),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
