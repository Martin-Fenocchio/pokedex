import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/features/dashboard/cubit/dashboard_cubit.dart';
import 'package:pokedex/features/dashboard/service/pokemon_service.dart';

dynamic getCubits() {
  return [
    BlocProvider(
      create: (context) => DashboardCubit(service: PokemonService()),
    ),
  ];
}
