part of 'CompanyFavDetailsImports.dart';

class CompanyFavDetailsData {
  late AnimationController controller;
  late Animation<double> animation;
  Timer? timer;
  final GenericCubit<bool> commentCubit = GenericCubit(false);
  final GenericCubit<double> expandCubit = GenericCubit(0);
  final GenericCubit<bool> showExpandCubit = GenericCubit(false);
  final TextEditingController comment = TextEditingController();
}
