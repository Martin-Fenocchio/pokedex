import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/utils/bloc/bloc_utis.dart';
import 'package:pokedex/utils/routes/routes_enum.dart';
import 'package:pokedex/utils/routes/routes_utils.dart';
import 'package:pokedex/utils/theme/theme.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: getCubits(),
      child: ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return MaterialApp(
            title: 'Pokédex',
            theme: ThemeConfig().getTheme(),
            routes: getRoutes(),
            initialRoute: RoutesList.dashboard,
            home: Container(),
          );
        },
      ),
    );
  }
}
