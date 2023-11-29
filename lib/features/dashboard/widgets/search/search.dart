import 'package:flutter/material.dart';
import 'package:pokedex/utils/responsive/responsive.dart';
import 'package:pokedex/utils/theme/theme.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 5.h(context),
          width: 75.w(context),
          child: TextField(
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(top: 0.5.h(context)),
                hintText: 'Search',
                hintStyle: const TextStyle(color: Color(0xff666666)),
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(
                  Icons.search,
                  color: colorPmy(context),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none)),
          ),
        ),
        CircleAvatar(
          radius: 2.5.h(context),
          backgroundColor: Colors.white,
          child: Text(
            '#',
            style: TextStyle(color: colorPmy(context)),
          ),
        )
      ],
    );
  }
}
