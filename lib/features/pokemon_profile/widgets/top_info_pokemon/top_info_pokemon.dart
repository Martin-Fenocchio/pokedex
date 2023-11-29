import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex/utils/responsive/responsive.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TopInfoPokemon extends StatelessWidget {
  const TopInfoPokemon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 4.h(context),
        bottom: 3.h(context),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          weight(),
          const Spacer(),
          divider(),
          const Spacer(),
          height(),
          const Spacer(),
          divider(),
          const Spacer(),
          moves()
        ],
      ),
    );
  }

  Widget weight() {
    return Builder(builder: (context) {
      return Column(
        children: [
          Row(
            children: [
              SvgPicture.asset('assets/icons/weight.svg'),
              SizedBox(
                width: 1.w(context),
              ),
              const Text(
                '9,0 kg',
                style: TextStyle(fontWeight: FontWeight.normal),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 2.h(context), bottom: 2.h(context)),
            child: Text(
              'Weight',
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14.sp),
            ),
          )
        ],
      );
    });
  }

  Widget height() {
    return Builder(builder: (context) {
      return Column(
        children: [
          Row(
            children: [
              SvgPicture.asset('assets/icons/height.svg'),
              SizedBox(
                width: 2.w(context),
              ),
              const Text(
                '0,5 m',
                style: TextStyle(fontWeight: FontWeight.normal),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 2.h(context), bottom: 2.h(context)),
            child: Text(
              'Height',
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14.sp),
            ),
          )
        ],
      );
    });
  }

  Widget moves() {
    return Builder(builder: (context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Torrent',
            style: TextStyle(
              fontWeight: FontWeight.normal,
            ),
          ),
          const Text(
            'Rain-Dish',
            style: TextStyle(
              fontWeight: FontWeight.normal,
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: 16.w(context),
            margin: EdgeInsets.only(top: 1.h(context), bottom: 2.h(context)),
            child: Text(
              'Moves',
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14.sp),
            ),
          )
        ],
      );
    });
  }

  Widget divider() {
    return Builder(builder: (context) {
      return Container(
        height: 10.h(context),
        width: 1.5,
        color: const Color(0xffE0E0E0),
      );
    });
  }
}
