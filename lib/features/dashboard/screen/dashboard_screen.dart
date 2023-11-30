import 'package:flutter/material.dart';
import 'package:pokedex/features/dashboard/widgets/header/header.dart';
import 'package:pokedex/features/dashboard/widgets/pokemon_list/pokemon_list.dart';
import 'package:pokedex/utils/theme/theme.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorPmy(context),
        body: const SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(),
              PokemonList(),
            ],
          ),
        ));
  }
}
