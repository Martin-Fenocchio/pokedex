import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/features/dashboard/cubit/dashboard_cubit.dart';
import 'package:pokedex/utils/responsive/responsive.dart';
import 'package:pokedex/utils/theme/theme.dart';

class Dropdown extends StatelessWidget {
  const Dropdown({super.key});

  void onSelect(String option, BuildContext context) {
    context.read<DashboardCubit>().sortBy(option);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<DashboardCubit>();

    return DropdownButtonHideUnderline(
        child: DropdownButton2(
      customButton: CircleAvatar(
        radius: 2.5.h(context),
        backgroundColor: Colors.white,
        child: Text(
          cubit.state.sortBy == 'Name' ? 'A' : '#',
          style: TextStyle(color: colorPmy(context)),
        ),
      ),
      barrierColor: Colors.black.withOpacity(0.4),
      dropdownStyleData: DropdownStyleData(
          padding: EdgeInsets.only(bottom: 2.w(context)),
          useSafeArea: false,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: colorPmy(context),
          ),
          width: 40.w(context),
          offset: Offset(-30.w(context), 0)),
      onChanged: (dynamic newValue) {},
      value: 'number',
      menuItemStyleData: MenuItemStyleData(
          padding: EdgeInsets.only(left: 2.w(context), right: 2.w(context))),
      items: [
        DropdownMenuItem(
          value: 'header',
          enabled: false,
          child: header(),
        ),
        DropdownMenuItem(
          enabled: false,
          value: 'number',
          child: item(
            isTop: true,
            onChanged: (String option) => onSelect(option, context),
            optionSelected: cubit.state.sortBy,
            label: 'Number',
          ),
        ),
        DropdownMenuItem(
          enabled: false,
          value: 'name',
          child: item(
            onChanged: (String option) => onSelect(option, context),
            isTop: false,
            optionSelected: cubit.state.sortBy,
            label: 'Name',
          ),
        )
      ],
    ));
  }

  Widget header() {
    return Builder(builder: (context) {
      return Container(
        height: 10.h(context),
        width: 50.w(context),
        color: colorPmy(context),
        child: const Center(
          child: Text(
            'Sort by:',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      );
    });
  }

  Widget item(
      {required bool isTop,
      required String label,
      required String optionSelected,
      required Function(String) onChanged}) {
    final borderRadius = BorderRadius.only(
        topLeft: Radius.circular(isTop ? 10 : 0),
        topRight: Radius.circular(isTop ? 10 : 0),
        bottomLeft: Radius.circular(isTop ? 0 : 10),
        bottomRight: Radius.circular(isTop ? 0 : 10));

    return Builder(builder: (context) {
      return GestureDetector(
        onTap: () {
          onChanged(label);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            color: Colors.white,
          ),
          height: 10.h(context),
          width: 50.w(context),
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              Radio(
                  value: label,
                  groupValue: optionSelected,
                  activeColor: colorPmy(context),
                  onChanged: (e) {
                    onChanged(label);
                  }),
              Text(label),
            ],
          ),
        ),
      );
    });
  }
}
