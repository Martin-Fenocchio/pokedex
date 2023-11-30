import 'package:flutter/material.dart';
import 'package:pokedex/features/dashboard/screen/dashboard_screen.dart';
import 'package:pokedex/features/pokemon_profile/screen/pokemon_profile_screen.dart';
import 'package:pokedex/features/splash/screen/splash_screen.dart';
import 'package:pokedex/utils/routes/routes_enum.dart';

Map<String, Widget Function(BuildContext)> getRoutes() {
  return {
    RoutesList.dashboard: (context) => const DashboardScreen(),
    RoutesList.pokemonProfile: (context) => const PokemonProfileScreen(),
    RoutesList.splash: (context) => const SplashScreen(),
  };
}
