import 'package:base_flutter/general/blocks/generic_cubit/generic_cubit.dart';

class WelcomeModel {
  String image;
  String desc;
  bool last;
  int? index;
  GenericCubit<int>? pageCubit;

  WelcomeModel({
    required this.image,
    required this.desc,
    this.last = false,
    this.index,
    this.pageCubit,
  });
}
