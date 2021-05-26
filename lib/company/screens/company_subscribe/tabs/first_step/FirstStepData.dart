part of 'FirstStepImports.dart';

class FirstStepData {
  final TextEditingController name = new TextEditingController();
  final TextEditingController msg = new TextEditingController();
  final TextEditingController fileName = new TextEditingController();
  final TextEditingController imgName = new TextEditingController();

  final GenericCubit<bool> showFile = new GenericCubit<bool>(false);
  final GenericCubit<bool> showImage = new GenericCubit<bool>(false);
}
