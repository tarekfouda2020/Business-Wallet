import 'package:base_flutter/general/blocks/generic_cubit/generic_cubit.dart';
import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dots_indicator/dots_indicator.dart';

class IndicatorDots extends StatelessWidget {
  final GenericCubit<int>? pagesCubit;
  final int dots;

  IndicatorDots({this.pagesCubit,required this.dots});


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit<int>, GenericState<int>>(
      bloc: pagesCubit,
      builder: (_, state) {
        return DotsIndicator(
          position: state.data.toDouble(),
          dotsCount: dots,
          decorator: DotsDecorator(
            activeColor: MyColors.white,
            color: MyColors.primary,
            size: const Size.square(12),
            activeSize: const Size(15.0, 15.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        );
      },
    );
  }
}
