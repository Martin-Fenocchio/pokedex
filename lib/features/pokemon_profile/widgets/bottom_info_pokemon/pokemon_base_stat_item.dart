import 'package:flutter/material.dart';
import 'package:pokedex/utils/pokemon/pokemon_utils.dart';
import 'package:pokedex/utils/responsive/responsive.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PokemonBaseStatItem extends StatelessWidget {
  const PokemonBaseStatItem(
      {super.key, required this.stat, required this.color});
  final Map<dynamic, dynamic> stat;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 4.h(context),
      child: Row(
        children: [
          SizedBox(
            width: 12.w(context),
            child: Text(
              getStatAbbr(stat['name']),
              style: TextStyle(
                  fontSize: 3.5.w(context),
                  color: color,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.end,
            ),
          ),
          Container(
            height: 4.h(context),
            width: 1.5,
            margin: EdgeInsets.symmetric(horizontal: 3.w(context)),
            color: const Color(0xffE0E0E0),
          ),
          Text(
            '${stat['value']}',
            style: TextStyle(fontSize: 16.sp),
          ),
          SizedBox(
            width: 3.w(context),
          ),
          SizedBox(
            width: 50.w(context),
            child: LinearProgressIndicator(
              backgroundColor: color.withOpacity(0.3),
              color: color,
              minHeight: 1.h(context),
              value: stat['value'] / 100,
              semanticsLabel: 'Linear progress indicator',
            ),
          ),
        ],
      ),
    );
  }
}
