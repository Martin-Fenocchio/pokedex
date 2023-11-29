import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/features/dashboard/cubit/dashboard_cubit.dart';

dynamic getCubits() {
  return [
    BlocProvider(
      create: (context) => DashboardCubit(),
    ),
  ];
}
