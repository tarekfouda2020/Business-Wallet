part of 'ContactUsImports.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final ContactUsData contactUsData = new ContactUsData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darken,
      appBar: DefaultAppBar(
        title: "تواصل معنا",
      ),
      body: ListView(
        children: [
          HeaderLogo(),
          BuildContactUsForm(
            contactUsData: contactUsData,
          ),
          LoadingButton(
            btnKey: contactUsData.btnKey,
            title: "ارسال",
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            color: MyColors.primary,
            borderRadius: 30,
            onTap: () {},
          ),
          BuildSocialView(),
        ],
      ),
    );
  }
}
