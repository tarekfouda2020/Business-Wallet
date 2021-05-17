part of 'CompanyRegisterImports.dart';

class CompanyRegisterData {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final TextEditingController name = new TextEditingController();
  final TextEditingController email = new TextEditingController();
  final TextEditingController phone = new TextEditingController();
  final TextEditingController companyName = new TextEditingController();
  final TextEditingController companyEmail = new TextEditingController();
  final TextEditingController companyPhone = new TextEditingController();
  final TextEditingController password = new TextEditingController();
  final TextEditingController confirmPassword = new TextEditingController();
  final TextEditingController code = new TextEditingController();

  final GenericCubit<bool> termCubit = new GenericCubit(false);

}
