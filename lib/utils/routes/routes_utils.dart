import 'package:flutter/material.dart';
import 'package:pokedex/features/dashboard/screen/dashboard_screen.dart';
import 'package:pokedex/utils/routes/routes_enum.dart';

Map<String, Widget Function(BuildContext)> getRoutes() {
  return {
    // Onboarding
    RoutesList.dashboard: (context) => const DashboardScreen(),
  };
}
