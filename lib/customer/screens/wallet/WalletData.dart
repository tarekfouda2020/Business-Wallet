part of'WalletImports.dart';
class WalletData{
  final GlobalKey<FormState> formKey = new GlobalKey();
  final GlobalKey<CustomButtonState> btnKey = new GlobalKey();

  final GenericCubit<bool> checkCubit = new GenericCubit(false);

  final TextEditingController wallet = new TextEditingController();
}