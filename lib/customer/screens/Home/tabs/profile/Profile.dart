part of 'ProfileImports.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darken,
      appBar: DefaultAppBar(
        title: "حسابي",
        showLeading: false,
      ),
      body: Column(
        children: [
          Container(
            color: MyColors.black,
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: MyColors.primary,
                      ),
                      shape: BoxShape.circle),
                  padding: const EdgeInsets.all(6),
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(
                              Res.on3,
                            ),
                            fit: BoxFit.fill)),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: MyText(
                      title: "الاسم",
                    ),
                  ),
                ),
                InkWell(
                  // onTap: ,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: MyColors.primary),
                    alignment: Alignment.center,
                    child: MyText(
                      title: "الصفحة الشخصية",
                      color: MyColors.blackOpacity,
                      size: 9.5,
                    ),
                  ),
                )
              ],
            ),
          ),
          Flexible(
            child: ListView(
              padding: const EdgeInsets.only(top: 15),
              physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              children: [
                BuildProfileItem(
                  title: "رقم المحفظة",
                  icon: Icons.code,
                ),
                BuildProfileItem(
                  title: "المحفظة",
                  icon: Icons.monetization_on,
                ),
                BuildProfileItem(
                  title: "الاهتمامات",
                  icon: MdiIcons.accountGroup,
                ),
                BuildProfileItem(
                  title: "المراسلات",
                  icon: MdiIcons.chatProcessingOutline,
                ),
                BuildProfileItem(
                  title: "التعليقات",
                  icon: Icons.message,
                ),
                BuildProfileItem(
                  title: "مشاركة التطبيق",
                  icon: Icons.share,
                ),
                BuildProfileItem(
                  title: "معلومات التطبيق",
                  icon: Icons.settings,
                ),
                BuildProfileItem(
                  title: "تواصل معنا",
                  icon: Icons.phone_in_talk,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  color: MyColors.black,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.logout,
                        size: 30,
                        color: MyColors.primary,
                      ),
                      Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: MyText(
                            title: "تسجيل الخروج",
                            size: 14,
                            color: MyColors.primary,
                          ))
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
