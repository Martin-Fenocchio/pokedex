import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex/features/dashboard/cubit/dashboard_cubit.dart';
import 'package:pokedex/utils/responsive/responsive.dart';
import 'package:pokedex/utils/routes/routes_enum.dart';
import 'package:pokedex/utils/theme/theme.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<DashboardCubit>().getListOfAllPokemones();

      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushNamedAndRemoveUntil(
            context, RoutesList.dashboard, (route) => false);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPmy(context),
      body: SizedBox(
        width: 100.w(context),
        height: 100.h(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Animate(
              effects: const [
                FadeEffect(duration: Duration(seconds: 1)),
              ],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/pokeball.svg',
                    width: 10.w(context),
                  ),
                  SizedBox(
                    width: 5.w(context),
                  ),
                  Text(
                    'Pokédex',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 27.sp),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
