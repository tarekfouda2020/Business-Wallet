part of 'ProfileWidgetsImports.dart';

class BuildProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var customer= context.read<UserCubit>().state.model.customerModel;
    return Flexible(
      child: ListView(
        padding: const EdgeInsets.only(top: 15, bottom: 60),
        children: [
          BuildProfileItem(
            title: "رقم المحفظة",
            icon: Icons.code,
            page: NumberWallet(),
          ),
          BuildProfileItem(
            title: "المحفظة",
            icon: Icons.monetization_on,
            page: Wallet(),
          ),
          BuildProfileItem(
            title: "الاهتمامات",
            icon: MdiIcons.accountGroup,
            page: Important(userId: customer!.userId),
          ),
          BuildProfileItem(
            title: "المراسلات",
            icon: MdiIcons.chatProcessingOutline,
            page: Conversation(),
          ),
          BuildProfileItem(
            title: "التعليقات",
            icon: Icons.message,
            page: Comments(),
          ),
          BuildProfileItem(
            title: "مشاركة التطبيق",
            icon: Icons.share,
            onTap: (){},
          ),
          BuildProfileItem(
            title: "معلومات التطبيق",
            icon: Icons.settings,
            page: AppInfo(),
          ),
          BuildProfileItem(
            title: "تواصل معنا",
            icon: Icons.phone_in_talk,
            page: ContactUs(),
          ),
          InkWell(
            onTap: () => GeneralRepository(context).customerLogout(),
            child: Container(
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
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
