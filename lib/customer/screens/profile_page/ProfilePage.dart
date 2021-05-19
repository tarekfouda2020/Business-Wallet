part of 'ProfilePageImports.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darken,
      appBar: DefaultAppBar(
        title: "حسابي",
      ),
      body: ListView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        children: [
          BuildProfileHeader(
            buttonText: "تعديل الصفحة الشخصية",
              // onTap: ()=> AutoRouter.of(context).push(ProfilePageRoute()),
              ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            color: MyColors.black,
            height: 35,
            child: MyText(
              title: "الصفحة الشخصية",
            ),
          ),
          BuildInfoItem(
            iconData: Icons.phone_in_talk,
            title: "رقم الجوال",
            details: "01234567890",
            iconColor: Colors.green,
          ),
          BuildInfoItem(
            iconData: Icons.email_sharp,
            title: "البريد الالكتروني",
            details: "aya@gmail.com",
          ),
          BuildInfoItem(
            iconData: Icons.person,
            title: "الجنس",
            details: "أنثى",
          ),
          BuildInfoItem(
            iconData: Icons.calendar_today_outlined,
            title: "تاريخ الميلاد",
            details: "18/1/2000",
          ),
          BuildInfoItem(
            iconData: Icons.home,
            title: "السكن",
            details: "لم يحدد بعد",
          ),
          BuildInfoItem(
            iconData: Icons.directions_bus,
            title: "مستوى التعليم",
            details: "لم يحدد بعد",
          ),
          BuildInfoItem(
            iconData: MdiIcons.accountGroup,
            title: "أفراد الأسرة",
            details: "لم يحدد بعد",
          ),
          BuildInfoItem(
            iconData: Icons.monetization_on,
            title: "متوسط الدخل",
            details: "لم يحدد بعد",
          ),
        ],
      ),
    );
  }
}
