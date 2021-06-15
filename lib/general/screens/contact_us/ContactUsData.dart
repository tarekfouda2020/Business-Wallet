part of 'ContactUsImports.dart';

class ContactUsData {
  final TextEditingController userName = new TextEditingController();
  final TextEditingController phone = new TextEditingController();
  final TextEditingController address = new TextEditingController();
  final TextEditingController msg = new TextEditingController();
  final GlobalKey<CustomButtonState> btnKey =
      new GlobalKey<CustomButtonState>();
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  final GenericCubit<SocialModel?> socialCubit = new GenericCubit(null);

  void fetchData(BuildContext context) async {
    var data = await GeneralRepository(context).getSocial();
    socialCubit.onUpdateData(data);
  }


  void contactUs(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      btnKey.currentState!.animateForward();

      await GeneralRepository(context).sendMessage(
          name: userName.text,
          phone: phone.text,
          title: address.text,
          msg: msg.text);
      btnKey.currentState!.animateReverse();
      userName.clear();
      phone.clear();
      address.clear();
      msg.clear();
    }
  }
}
