import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/features/dashboard/cubit/dashboard_cubit.dart';
import 'package:pokedex/features/dashboard/widgets/search/dropdown.dart';
import 'package:pokedex/utils/responsive/responsive.dart';
import 'package:pokedex/utils/theme/theme.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  Timer? debounce;

  TextEditingController getController() {
    return context.read<DashboardCubit>().searchController;
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      getController().addListener(checkDebounce);
    });
  }

  void checkDebounce() {
    if (debounce?.isActive ?? false) debounce?.cancel();
    debounce = Timer(const Duration(milliseconds: 500), () {
      onSearch();
    });
  }

  void onSearch() {
    context.read<DashboardCubit>().onSearch();
  }

  @override
  void dispose() {
    getController().dispose();
    debounce?.cancel();
    super.dispose();
  }

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
            controller: getController(),
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
        const Dropdown()
      ],
    );
  }
}
