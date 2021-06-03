part of 'CompanyRegisterCommercialImports.dart';

class CompanyRegisterCommercialData {
  final TextEditingController commercialNumb = new TextEditingController();
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<CustomButtonState> btnKey =
      new GlobalKey<CustomButtonState>();

  void onCheckCommercial(BuildContext context, String userId) async {
    if (formKey.currentState!.validate()) {
      btnKey.currentState!.animateForward();
      await CompanyRepository(context)
          .checkCommercial(commercialNumb.text, userId);
      btnKey.currentState!.animateReverse();
    }
  }
}
