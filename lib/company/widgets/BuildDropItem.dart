
import 'dart:io';

import 'package:base_flutter/general/blocks/generic_cubit/generic_cubit.dart';
import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/widgets/MyText.dart';
import 'package:flutter/material.dart';

class BuildDropItem extends StatelessWidget {
  final String title;
  final GenericCubit<bool> genericCubit;

  BuildDropItem(
      {required this.title,required this.genericCubit});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => genericCubit
          .onUpdateData(!genericCubit.state.data),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin: const EdgeInsets.symmetric(vertical: 5),
        color: MyColors.black,
        child: Row(
          children: [
            MyText(
              title: title,
              color: genericCubit.state.data
                  ? MyColors.primary
                  : Colors.white70,
              size: 12,
            ),
            Spacer(),
            Icon(
              genericCubit.state.data
                  ? Icons.keyboard_arrow_up_rounded
                  : Icons.keyboard_arrow_down_rounded,
              color: genericCubit.state.data
                  ? MyColors.primary
                  : MyColors.greyWhite.withOpacity(.9),
            ),
          ],
        ),
      ),
    );
  }
}
