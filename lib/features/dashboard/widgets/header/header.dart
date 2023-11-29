import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex/features/dashboard/widgets/search/search.dart';
import 'package:pokedex/utils/theme/theme.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 20.h,
      color: colorPmy(context),
      padding: EdgeInsets.only(
        left: 5.w,
        right: 5.w,
        top: 8.h,
      ),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset('assets/icons/pokeball.svg'),
              SizedBox(
                width: 5.w,
              ),
              Text(
                'Pokédex',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp),
              )
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          const Search(),
        ],
      ),
    );
  }
}
